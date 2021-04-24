class Subscriptions::Show < BrowserAction
  include Auth::RequireSignIn

  get "/subscription" do
    subscription = current_user.subscription
    if subscription && subscription.is_active?
      html Subscriptions::SuccessPage
    else
      html Subscriptions::FailurePage
    end
  end
end
