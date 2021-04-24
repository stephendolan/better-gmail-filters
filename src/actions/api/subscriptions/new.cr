class Api::Subscriptions::New < ApiAction
  param price_id : String

  post "/api/subscriptions/new" do
    json({session_id: get_checkout_session_id(current_user)})
  end

  private def get_checkout_session_id(user : User)
    team = user.teams.first
    if team.stripe_id.nil?
      SaveTeam.update!(team, stripe_id: Stripe::Customer.create(email: user.email).id)
      team = team.reload
    end

    if (customer_stripe_id = team.stripe_id)
      Stripe::Checkout::Session.create(
        customer: customer_stripe_id,
        success_url: ::Subscriptions::Show.url,
        cancel_url: ::Subscriptions::Index.url,
        client_reference_id: team.id.to_s,
        payment_method_types: ["card"],
        mode: "subscription",
        line_items: [
          {
            quantity: 1,
            price:    price_id,
          },
        ]
      ).id
    end
  end

  private def get_checkout_session_id(user : Nil)
    nil
  end
end
