class Api::Subscriptions::Edit < ApiAction
  post "/api/subscriptions/edit" do
    json({url: get_billing_portal_session_url(current_user)})
  end

  private def get_billing_portal_session_url(user : User)
    team = user.teams.first

    if team.stripe_id.nil?
      raise <<-ERROR
        Billing portal requested for Team '#{team.id}', but no stripe_id was found.
        It should not be possible for a user without a Stripe ID to see a billing portal link.
        ERROR
    end

    if (customer_stripe_id = team.stripe_id)
      Stripe::BillingPortal::Session.create(
        customer: customer_stripe_id,
        return_url: ::Me::Edit.url,
      ).url
    end
  end

  private def get_billing_portal_session_url(user : Nil)
    nil
  end
end
