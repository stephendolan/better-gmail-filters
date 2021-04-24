class Policies::CancellationsPage < MainLayout
  def page_title
    "Cancellation Policy"
  end

  def content
    section class: "max-w-5xl mx-auto py-6 sm:px-6 lg:px-8" do
      mount UI::Card,
        title: page_title,
        body: ->{ render_cancellation_policy_article }
    end
  end

  private def render_cancellation_policy_article
    article class: "prose max-w-none" do
      para do
        em "Last updated: April 24, 2021"
      end

      para "We want satisfied customers, not hostages. That’s why we make it easy for you to cancel your account directly in all of our apps — no phone calls required, no questions asked."

      para do
        text "Account owners can visit their "
        link "Account Page", Me::Edit
        text " to cancel their current subscription at any time."
      end

      para do
        text "Our legal responsibility is to account owners, which means we cannot cancel an account at the request of anyone else. If for whatever reason you no longer know who the account owner is, "
        a "contact us", href: "mailto:#{Application.settings.support_email}"
        text ". We will gladly reach out to any current account owners at the email addresses we have on file."
      end

      h2 "What happens when you cancel?", id: "what-happens-when-you-cancel-"

      para "You won’t be able to access any premium content through your account once you cancel, so make sure you soak up all of the knowledge and goodies you need beforehand."

      para do
        text "We won’t bill you again once you cancel. We don’t automatically prorate any unused time you may have left but if you haven’t used your account in months or just started a new billing cycle, "
        a "contact us", href: "mailto:#{Application.settings.support_email}"
        text " for a "
        link "fair refund", Policies::Refunds
        text ". We’ll treat you right."
      end

      h2 "#{Application.settings.name}-initiated cancellations", id: "#{Application.settings.name}-initiated-cancellations"

      para do
        text "We retain the right to suspend or terminate accounts for any reason at any time, as outlined in our "
        link "Terms of Service", Policies::TermsOfService
        text ". In practice, this generally means we will cancel your account without notice if we have evidence that you are using our products to engage in abusive behavior."
      end

      render_attribution
    end
  end

  private def render_attribution
    h2 "Attribution", id: "attribution"

    para do
      text "Adapted from the "
      a "Basecamp open-source policies", href: "https://github.com/basecamp/policies"
      text " / "
      a "CC BY 4.0", href: "https://creativecommons.org/licenses/by/4.0/"
    end
  end
end
