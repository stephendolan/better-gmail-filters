class Policies::TermsOfServicePage < MainLayout
  def page_title
    "Terms of Service"
  end

  def content
    section class: "max-w-5xl mx-auto py-6 sm:px-6 lg:px-8" do
      mount UI::Card,
        title: page_title,
        body: ->{ render_terms_article }
    end
  end

  private def render_terms_article
    article class: "prose max-w-none" do
      para do
        em "Last updated: April 24, 2021"
      end

      para "From everyone at #{Application.settings.name}, thank you for using our products! We build them to help you learn and do your best work. Because we don't know every one of our customers personally, we have to put in place some Terms of Service to help keep the ship afloat."

      para "When we say “Company”, “we”, “our”, or “us” in this document, we are referring to #{Application.settings.name}, LLC."

      para "When we say “Services”, we mean any product created and maintained by #{Application.settings.name}, LLC. That includes all LuckyCast content, whether delivered within a web browser, desktop application, mobile application, or another format."

      para do
        text "When we say “You” or “your”, we are referring to the people or organizations that own an account with one or more of our Services."
      end

      para do
        text "We may update these Terms of Service in the future. Typically these changes have been to clarify some of these terms by linking to an expanded related policy. Whenever we make a significant change to our policies, we will also announce them with a prominent notification on "
        a "#{Application.settings.domain}", href: "https://#{Application.settings.domain}"
        text "."
      end

      para do
        text "When you use our Services, now or in the future, you are agreeing to the latest Terms of Service. That's true for any of our existing and future products and all features that we add to our Services over time. There may be times where we do not exercise or enforce any right or provision of the Terms of Service; in doing so, we are not waiving that right or provision. "
        strong "These terms do contain a limitation of our liability."
      end

      para do
        text "If you violate any of the terms, we may terminate your account. That's a broad statement and it means you need to place a lot of trust in us. We do our best to deserve that trust by keeping an open door to "
        a "your feedback", href: "mailto:#{Application.settings.support_email}"
        text "."
      end

      h2 "Account Terms", id: "account-terms"

      ol do
        li do
          text "You are responsible for maintaining the security of your account and password. The Company cannot and will not be liable for any loss or damage from your failure to comply with this security obligation."
        end
        li "You are responsible for all content posted and activity that occurs under your account. That includes content posted by others who either: (a) have access to your login credentials; or (b) have their own logins under your account."
        li "You must be a human. Accounts registered by “bots” or other automated methods are not permitted."
      end

      h2 "Payment, Refunds, and Plan Changes", id: "payment-refunds-and-plan-changes"

      ol do
        li "If you are using the free version of one of our Services, it is really free: we do not ask you for your credit card and — just like for customers who pay for our Services — we do not sell your data."

        li do
          text "For paid Services that offer a free trial, we explain the length of trial when you sign up. After the trial period, you need to pay in advance to keep using the Service. If you do not pay, we will freeze your account and it will be inaccessible until you make payment."
        end

        li "If you are upgrading from a free plan to a paid plan, we will charge your card immediately and your billing cycle starts on the day of upgrade. For other upgrades or downgrades in plan level, we will charge your card immediately, appropriately prorating based on usage."

        li do
          text "All fees are exclusive of all taxes, levies, or duties imposed by taxing authorities. Where required, we will collect those taxes on behalf of the taxing authority and remit those taxes to taxing authorities. Otherwise, you are responsible for payment of all taxes, levies, or duties."
        end

        li do
          text "We process refunds according to our "
          link "Refund Policy", Policies::Refunds
          text "."
        end
      end

      h2 "Cancellation and Termination", id: "cancellation-and-termination"

      ol do
        li do
          text "You are solely responsible for properly canceling your account. Within each of our Services, we provide a simple no-questions-asked cancellation link. You can find instructions for how to cancel your account in our "
          link "Cancellation policy", Policies::Cancellations
          text ". An email or phone request to cancel your account is not automatically considered cancellation. If you need help cancelling your account, you can always "
          a "contact our Support team", href: "mailto:#{Application.settings.support_email}"
          text "."
        end

        li do
          text "All premium content will be inaccessible from the Services immediately upon cancellation."
        end

        li do
          text "If you cancel the Service before the end of your current paid up month, your cancellation will take effect immediately, and you will not be charged again. We do not automatically prorate unused time in the last billing cycle. See our "
          link "Refund Policy", Policies::Refunds
          text " for more details."
        end

        li do
          text "We have the right to suspend or terminate your account and refuse any and all current or future use of our Services for any reason at any time. Suspension means you and any other users on your account will not be able to access the account or any content in the account. Termination will furthermore result in the deletion of your account or your access to your account, and the forfeiture and relinquishment of all content in your account. We also reserve the right to refuse the use of the Services to anyone for any reason at any time. We have this clause because statistically speaking, out of the hundreds of thousands of potential users of our Services, there is at least one doing something nefarious. There are some things we staunchly stand against and this clause is how we exercise that stance."
        end

        li "Verbal, physical, written or other abuse (including threats of abuse or retribution) of a Company employee or officer will result in immediate account termination."
      end

      h2 "Modifications to the Service and Prices", id: "modifications-to-the-service-and-prices"

      ol do
        li do
          text "When it comes to security, privacy, and customer support, we will continue to maintain all legacy Services. Sometimes it becomes technically impossible to continue a feature or we redesign a part of our Services because we think it could be better or we decide to close new signups of a product. We reserve the right at any time to modify or discontinue, temporarily or permanently, any part of our Services with or without notice."
        end

        li "Sometimes we change the pricing structure for our products. When we do that, we tend to exempt existing customers from those changes. However, we may choose to change the prices for existing customers. If we do so, we will give at least 30 days notice and will notify you via the email address on record. We may also post a notice about changes on our websites or the affected Services themselves."
      end

      h2 "Uptime, Security, and Privacy", id: "uptime-security-and-privacy"

      ol do
        li do
          text "Your use of the Services is at your sole risk. We provide these Services on an “as is” and “as available” basis. We do not offer service-level agreements for any of our Services."
        end

        li "We reserve the right to temporarily disable your account if your usage significantly exceeds the average usage of other customers of the Services. Of course, we'll reach out to the account owner before taking any action except in rare cases where the level of use may negatively impact the performance of the Service for other customers."

        li do
          para do
            text "When you use our Services, you entrust us with your data. We take that trust to heart. You agree that #{Application.settings.name} may process your data as described in our "
            link "Privacy Policy", Policies::Privacy
            text " and for no other purpose. We as humans can access your data for the following reasons:"
          end

          ul do
            li do
              strong "To help you with support requests you make."
              text " We'll ask for express consent before accessing your account."
            end

            li do
              strong "On the rare occasions when an error occurs that stops an automated process partway through."
              text " We get automated alerts when such errors occur. When we can fix the issue and restart automated processing without looking at any personal data, we do. In rare cases, we have to look at a minimum amount of personal data to fix the issue. In these rare cases, we aim to fix the root cause as much as possible to avoid the errors from reoccurring."
            end

            li do
              strong "To safeguard #{Application.settings.name}."
              text " We'll look at logs and metadata as part of our work to ensure the security of your data and the Services as a whole."
            end

            li do
              strong "To the extent required by applicable law."
              text " As a US company with all data infrastructure located in the US, we only preserve or share customer data if compelled by a US government authority with a legally binding order or proper request under the Stored Communications Act. If a non-US authority approaches #{Application.settings.name} for assistance, our default stance is to refuse unless the order has been approved by the US government, which compels us to comply through procedures outlined in an established mutual legal assistance treaty or agreement mechanism. If #{Application.settings.name} is audited by a tax authority, we only share the bare minimum billing information needed to complete the audit."
            end
          end
        end

        li do
          para do
            text "We use third party vendors and hosting partners to provide the necessary hardware, software, networking, storage, and related technology required to run the Services. You can see a list of all subprocessors who handle personal data for #{Application.settings.name} in our"
            link "Subprocessor Notice", Policies::Privacy::Subprocessors
            text "."
          end
        end

        li do
          text "Under the California Consumer Privacy Act (“CCPA”), #{Application.settings.name} is a “service provider”, not a “business” or “third party”, with respect to your use of the Services. That means we process any data you share with us only for the purpose you signed up for and as described in these Terms of Service, "
          link "Privacy policy", Policies::Privacy
          text ", and other policies. We do not retain, use, disclose, or sell any of that information for any other commercial purposes unless we have your explicit permission. And on the flip-side, you agree to comply with your requirements under the CCPA and not use #{Application.settings.name}’s Services in a way that violates the regulations."
        end
      end

      h2 "Copyright and Content Ownership", id: "copyright-and-content-ownership"

      ol do
        li do
          text "All content posted on the Services must comply with U.S. copyright law."
        end

        li "We claim no intellectual property rights over the material you provide to the Services. All materials uploaded remain yours."

        li "We do not pre-screen content, but reserve the right (but not the obligation) in our sole discretion to refuse or remove any content that is available via the Service."
        li do
          text "The names, look, and feel of the Services are copyright© to the Company. All rights reserved. You may not duplicate, copy, or reuse any portion of the HTML, CSS, JavaScript, or visual design elements without express written permission from the Company. You must request permission to use the Company's logo or any Service logos for promotional purposes. Please "
          a "email us", href: "mailto:#{Application.settings.support_email}"
          text " requests to use logos. We reserve the right to rescind this permission if you violate these Terms of Service."
        end

        li "You agree not to reproduce, duplicate, copy, sell, resell or exploit any portion of the Services, use of the Services, or access to the Services without the express written permission by the Company."

        li "You must not modify another website so as to falsely imply that it is associated with the Services or the Company."
      end

      h2 "Features and Bugs", id: "features-and-bugs"

      para "We design our Services with care, based on our own experience and the experiences of customers who share their time and feedback. However, there is no such thing as a service that pleases everybody. We make no guarantees that our Services will meet your specific requirements or expectations."

      para "We also test all of our features extensively before shipping them. As with any software, our Services inevitably have some bugs. We track the bugs reported to us and work through priority ones, especially any related to security or privacy. Not all reported bugs will get fixed and we don't guarantee completely error-free Services."

      para "We mention liability throughout these Terms but to put it all in one section:"

      para do
        strong do
          em "You expressly understand and agree that the Company shall not be liable, in law or in equity, to you or to any third party for any direct, indirect, incidental, lost profits, special, consequential, punitive or exemplary damages, including, but not limited to, damages for loss of profits, goodwill, use, data or other intangible losses (even if the Company has been advised of the possibility of such damages), resulting from: (i) the use or the inability to use the Services; (ii) the cost of procurement of substitute goods and services resulting from any goods, data, information or services purchased or obtained or messages received or transactions entered into through or from the Services; (iii) unauthorized access to or alteration of your transmissions or data; (iv) statements or conduct of any third party on the service; (v) or any other matter relating to this Terms of Service or the Services, whether as a breach of contract, tort (including negligence whether active or passive), or any other theory of liability."
        end
      end

      para do
        text "In other words: choosing to use our Services does mean you are making a bet on us. If the bet does not work out, that's on you, not us. We do our darnedest to be as safe a bet as possible through careful management of the business; investments in security, infrastructure, and talent; and in general giving a damn. If you choose to use our Services, thank you for betting on us."
      end

      para do
        text "If you have a question about any of the Terms of Service, please "
        a "contact our Support team", href: "mailto:#{Application.settings.support_email}"
        text "."
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
