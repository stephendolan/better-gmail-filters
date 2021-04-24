class Api::Webhooks::Stripe < ApiAction
  include ::Stripe::SignatureVerification

  accepted_formats [:xml]

  class StripeWebhookObject
    include JSON::Serializable
    property id : String
  end

  class StripeWebhookData
    include JSON::Serializable
    property object : StripeWebhookObject
  end

  class StripeWebhook
    include JSON::Serializable
    property type : String
    property data : StripeWebhookData
  end

  post "/api/webhooks/stripe" do
    request = StripeWebhook.from_json(params.body)

    case request.type
    when "customer.subscription.created", "customer.subscription.updated"
      stripe_subscription = ::Stripe::Subscription.retrieve(request.data.object.id)
      team = team_from_subscription(stripe_subscription)

      if (team_subscription = team.subscription)
        if stripe_subscription.id != team_subscription.stripe_id
          raise <<-ERROR
            Recieved '#{request.type}' for Team '#{team.id}' (Customer '#{stripe_subscription.customer}').
            Provided Stripe Subscription ID was '#{stripe_subscription.id}', but Customer still has a valid Subscription with a different identifier ('#{team_subscription.stripe_id}').
            This should be investigated, since updates to a Subscription should only occur for the same Subscription ID.
          ERROR
        end

        SaveSubscription.update!(
          team_subscription,
          stripe_id: stripe_subscription.id,
          stripe_data: JSON.parse(stripe_subscription.to_json),
          is_active: stripe_subscription.status == ::Stripe::Subscription::Status::Active
        )
      else
        SaveSubscription.create!(
          team_id: team.id,
          stripe_id: stripe_subscription.id,
          stripe_data: JSON.parse(stripe_subscription.to_json),
          is_active: stripe_subscription.status == ::Stripe::Subscription::Status::Active
        )
      end
    when "customer.subscription.deleted"
      stripe_subscription = ::Stripe::Subscription.retrieve(request.data.object.id)
      team = team_from_subscription(stripe_subscription)

      if (team_subscription = team.subscription)
        team_subscription.delete
      else
        raise <<-ERROR
          Recieved '#{request.type}' for Team '#{team.id}' (Customer '#{stripe_subscription.customer}').
          No Subscriptions were found to delete.
        ERROR
      end
    end

    head :ok
  end

  private def team_from_subscription(stripe_subscription : ::Stripe::Subscription) : Team
    stripe_customer = stripe_subscription.customer
    unless stripe_customer
      raise "Stripe Subscription did not contain a Customer. All Subscriptions must be associated with a Customer."
    end

    stripe_customer_id = stripe_customer.is_a?(String) ? stripe_customer : stripe_customer.id

    team = TeamQuery.new.preload_subscription.stripe_id(stripe_customer_id).first?
    unless team
      raise "Team with stripe_id '#{stripe_customer_id}' does not exist in database."
    end

    team
  end
end
