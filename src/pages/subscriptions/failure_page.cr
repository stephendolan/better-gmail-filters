class Subscriptions::FailurePage < MainLayout
  def page_title
    "No subscription"
  end

  def content
    section class: "bg-primary-700" do
      div class: "max-w-2xl mx-auto text-center py-16 sm:py-28 md:py-44 px-4 sm:px-6 lg:px-8" do
        h2 class: "mt-4 text-3xl font-extrabold text-white sm:text-4xl" do
          text "No active subscription found 😢"
        end

        para class: "mt-4 text-lg leading-6 text-primary-100" do
          text "But don't despair! Click the button below and make it happen!"
        end

        if (user = current_user)
          if user.subscription
            button "Manage your subscription",
              class: "mt-8 mx-auto w-full inline-flex items-center justify-center px-5 py-3 border border-transparent text-base font-medium rounded-md text-primary-700 bg-white hover:bg-primary-50 sm:w-auto",
              data_controller: "stripe",
              data_action: "click->stripe#redirectToBillingPortal"
          else
            render_upgrade_link
          end
        else
          render_upgrade_link
        end

        div class: "mt-2 text-xs text-gray-200" do
          span "Something wrong? "
          a "Send us an email!", href: "mailto:#{Application.settings.support_email}?subject=Subscription Issue", class: "underline"
        end
      end
    end
  end

  private def render_upgrade_link
    link "Upgrade to Pro", Subscriptions::Index, class: "mt-8 mx-auto w-full inline-flex items-center justify-center px-5 py-3 border border-transparent text-base font-medium rounded-md text-primary-700 bg-white hover:bg-primary-50 sm:w-auto"
  end
end
