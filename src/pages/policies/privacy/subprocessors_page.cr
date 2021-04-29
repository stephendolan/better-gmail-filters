class Policies::Privacy::SubprocessorsPage < AuthLayout
  def page_title
    "Subprocessors"
  end

  def content
    section class: "max-w-5xl mx-auto py-6 sm:px-6 lg:px-8" do
      mount UI::Card,
        title: page_title,
        body: ->{ render_subprocessor_article }
    end
  end

  private def render_subprocessor_article
    article class: "prose max-w-none" do
      para do
        em "Last updated: April 24, 2021"
      end

      para do
        text "We use third party subprocessors, such as cloud computing providers and customer support software, to run #{Application.settings.name} (the service)."
      end

      para "The following is a list of personal data subprocessors we use. These subprocessors are all located in the United States:"

      ul do
        li do
          a "Render", href: "https://render.com/privacy"
          text ". Cloud services provider."
        end
        li do
          a "Stripe", href: "https://stripe.com/privacy-center/legal"
          text ". Payment processing services."
        end
        li do
          a "AWS SES", href: "https://aws.amazon.com/compliance/gdpr-center/"
          text ". Transactional email service."
        end
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
