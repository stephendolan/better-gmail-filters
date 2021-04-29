class Policies::RefundsPage < AuthLayout
  def page_title
    "Refund Policy"
  end

  def content
    section class: "max-w-5xl mx-auto py-6 sm:px-6 lg:px-8" do
      mount UI::Card,
        title: page_title,
        body: ->{ render_refund_policy_article }
    end
  end

  private def render_refund_policy_article
    article class: "prose max-w-none" do
      para do
        em "Last updated: April 24, 2021"
      end

      para do
        text "Bad refund policies are infuriating. You feel like the company is just trying to rip you off. We never want our customers to feel that way, so our refund policy is simple: If you’re ever unhappy with our products* for any reason, just contact "
        a "our support team", href: "mailto:#{Application.settings.support_email}"
        text " and we'll take care of you."
      end

      h2 "Examples of full refunds we’d grant.", id: "examples-of-full-refunds-we-d-grant-"

      ul do
        li "If you were just charged for your next month of service but you meant to cancel, we’re happy to refund that extra charge."
        li "If you tried one of our products for a couple months and you just weren’t happy with it, you can have your money back."
      end

      h2 "Get in touch", id: "get-in-touch"

      para do
        text "At the end of the day, nearly everything on the edges comes down to a case-by-case basis. "
        a "Send us a note", href: "mailto:#{Application.settings.support_email}"
        text ", tell us what's up, and we'll work with you to make sure you’re happy."
      end

      render_attribution

      small do
        em "*This policy applies to any product created and owned by #{Application.settings.name}, LLC."
      end
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
