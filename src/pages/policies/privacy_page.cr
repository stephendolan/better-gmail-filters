class Policies::PrivacyPage < MainLayout
  def page_title
    "Privacy Policy"
  end

  def content
    section class: "max-w-5xl mx-auto py-6 sm:px-6 lg:px-8" do
      mount UI::Card,
        title: page_title,
        body: ->{ render_privacy_policy_article }
    end
  end

  private def render_privacy_policy_article
    article class: "prose max-w-none" do
      para do
        em "Last updated: April 24, 2021"
      end

      para "The privacy of your data — and it is your data, not ours! — is a big deal to us. In this policy, we lay out: what data we collect and why; how your data is handled; and your rights to your data. We promise we never sell your data: never have, never will."

      para "This policy applies to all products built and maintained by #{Application.settings.name} LLC."

      h2 "What we collect and why", id: "what-we-collect-and-why"

      para "Our guiding principle is to collect only what we need. Here’s what that means in practice:"

      h3 "Identity & access", id: "identity-access"

      para "When you sign up for a #{Application.settings.name} product or service, we typically ask for identifying information such as your name, email address, and maybe a company name. That’s just so you can personalize your new account, and we can send you invoices, updates, or other essential information. We sometimes also give you the option to add a profile picture that displays in our products, but we do not normally look at or access that picture. We’ll never sell your personal info to third parties, and we won’t use your name or company in marketing statements without your permission either."

      h3 "Billing information", id: "billing-information"

      para "When you pay for a #{Application.settings.name} product, we ask for your credit card and billing address. That’s so we can charge you for service, calculate taxes due, and send you invoices. Your credit card is passed directly to our payment processor and doesn't ever go through our servers."

      h3 "Geolocation data", id: "geolocation-data"

      para "We do not log any customer IP addresses on our servers or in our databases."

      h3 "Website interactions", id: "website-interactions"

      para "When you browse our marketing pages or applications, your browser automatically shares certain information such as which operating system and browser version you are using. We track that information, along with the pages you are visiting, page load timing, and which website referred you for statistical purposes like conversion rates and to test new designs. We sometimes track specific link clicks to help inform some design decisions."

      h3 "Cookies and Do Not Track", id: "cookies-and-do-not-track"

      para do
        text "We do use persistent first-party cookies to store certain preferences, make it easier for you to use our applications, and support some in-house analytics. A cookie is a piece of text stored by your browser to help it remember your login information, site preferences, and more. You can adjust cookie retention settings in your own browser. To learn more about cookies, including how to view which cookies have been set and how to manage and delete them, please visit: "
        a "www.allaboutcookies.org", href: "https://www.allaboutcookies.org"
        text "."
      end

      para "At this time, our sites and applications do not respond to Do Not Track beacons sent by browser plugins."

      h3 "Voluntary correspondence", id: "voluntary-correspondence"

      para "When you write #{Application.settings.name} with a question or to ask for help, we keep that correspondence, including the email address, so that we have a history of past correspondences to reference if you reach out in the future."

      para "We also store any information you volunteer like surveys. Sometimes when we do customer interviews, we may ask for your permission to record the conversation for future reference or use. We only do so if you give your express consent."

      h3 "Information we do not collect", id: "information-we-do-not-collect"

      para "We don’t collect any characteristics of protected classifications including age, race, gender, religion, sexual orientation, gender identity, gender expression, or physical and mental abilities or disabilities. You may provide these data voluntarily, such as if you include a pronoun preference in your email signature when writing into our Support team."

      para "We also do not collect any biometric data. You are given the option to add a picture to your user profile, which could be a real picture of you or a picture of something else that represents you best. We do not extract any information from profile pictures: they are for your use alone."

      h2 "When we access or share your information", id: "when-we-access-or-share-your-information"

      para "Our default practice is to not access your information. The only times we’ll ever access or share your info are:"

      ul do
        li do
          strong "To provide products or services you've requested"
          text ". We do use some third-party services to run our applications and only to the extent necessary process some or all of your personal information via these third parties. You can view the list of third-party services we use in our "
          link "Subprocessor Policy", Policies::Privacy::Subprocessors
          text ". Having subprocessors means we are using technology to access your data. No #{Application.settings.name} human looks at your data for these purposes unless an error occurs that stops an automated process from working and requires manual intervention to fix. These are rare cases and when they happen, we look for root cause solutions as much as possible to avoid them from reoccurring."
        end

        li do
          strong "To help you troubleshoot or squash a software bug, with your permission."
          text " If at any point we need to access your account to help you with a Support case, we will ask for your consent before proceeding."
        end

        li do
          strong "To investigate, prevent, or take action regarding restricted or abusive uses."
          text " Accessing a customer’s account when investigating potential abuse is a measure of last resort. We have an obligation to protect the privacy and safety of both our customers and the people reporting issues to us. We do our best to balance those responsibilities throughout the process. If we do discover you are using our products for a restricted purpose, we will report the incident to the appropriate authorities."
        end

        li do
          strong "When required under applicable law."
        end
      end

      para "#{Application.settings.name}, LLC is a US company and all data infrastructure are located in the US."

      ul do
        li do
          text "If US law enforcement authorities have the necessary warrant, criminal subpoena, or court order requiring we share data, we have to comply. Otherwise, we flat-out reject requests from local and federal law enforcement when they seek data. And unless we’re legally prevented from it, we’ll always inform you when such requests are made. In the event a government authority outside the US approaches #{Application.settings.name} with a request, our default stance is to refuse unless the US government compels us to comply through procedures outlined in a mutual legal assistance treaty or agreement. "
          strong do
            em "We have never received a National Security Letter or Foreign Intelligence Surveillance Act (FISA) order."
          end
        end

        li "Similarly, if #{Application.settings.name} receives a request to preserve data, we refuse unless compelled by either the US Federal Stored Communications Act, 18 U.S.C. Section 2703(f) or a properly served US subpoena for civil matters. In both of these situations, we have to comply. In these situations, we notify affected customers as soon as possible unless we are legally prohibited from doing so. We do not share preserved data unless absolutely required under the Stored Communications Act or compelled by a court order that we choose not to appeal. Furthermore, unless we receive a proper warrant, court order, or subpoena before the required preservation period expires, we destroy any preserved copies we made of customer data once the preservation period lapses."
        li "If we get an informal request from any person, organization, or entity, we do not assist."
        li "If we are audited by a tax authority, we may be required to share billing-related information. If that happens, we only share the bare minimum needed such as billing addresses and tax exemption information."
      end

      para "Finally, if #{Application.settings.name}, LLC is acquired by or merged with another company — we don’t plan on that, but if it happens — we’ll notify you well before any info about you is transferred and becomes subject to a different privacy policy."

      h2 "Your rights with respect to your information", id: "your-rights-with-respect-to-your-information"

      para "At #{Application.settings.name}, we apply the same data rights to all customers, regardless of their location. Currently some of the most privacy-forward regulations in place are the European Union’s General Data Protection Regulation (“GDPR”) and California Consumer Privacy Act (“CCPA”) in the US. #{Application.settings.name} recognizes all of the rights granted in these regulations, except as limited by applicable law. These rights include:"
      ul do
        li do
          strong "Right to Know."
          text " You have the right to know what personal information is collected, used, shared or sold. We outline both the categories and specific bits of data we collect, as well as how they are used, in this privacy policy."
        end

        li do
          strong "Right of Access."
          text " This includes your right to access the personal information we gather about you, and your right to obtain information about the sharing, storage, security and processing of that information."
        end

        li do
          strong "Right to Correction."
          text " You have the right to request correction of your personal information."
        end

        li do
          strong "Right to Erasure / “To be Forgotten”."
          text " This is your right to request, subject to certain limitations under applicable law, that your personal information be erased from our possession and, by extension, all of our service providers. Fulfillment of some data deletion requests may prevent you from using #{Application.settings.name} services because our applications may then no longer work. In such cases, a data deletion request may result in closing your account."
        end

        li do
          strong "Right to Complain."
          text " You have the right to make a complaint regarding our handling of your personal information with the appropriate supervisory authority. To identify your specific authority or find out more about this right, EU individuals should go to "
          a "https://edpb.europa.eu/about-edpb/board/members_en", href: "https://edpb.europa.eu/about-edpb/board/members_en"
          text "."
        end

        li do
          strong "Right to Restrict Processing."
          text " This is your right to request restriction of how and why your personal information is used or processed, including opting out of sale of personal information. (Again: we never have and never will sell your personal data.)"
        end

        li do
          strong "Right to Object."
          text " You have the right, in certain situations, to object to how or why your personal information is processed."
        end

        li do
          strong "Right to Portability."
          text " You have the right to receive the personal information we have about you and the right to transmit it to another party."
        end

        li do
          strong "Right to not be subject to Automated Decision-Making."
          text " You have the right to object and prevent any decision that could have a legal, or similarly significant, effect on you from being made solely based on automated processes. This right is limited, however, if the decision is necessary for performance of any contract between you and us, is allowed by applicable law, or is based on your explicit consent."
        end

        li do
          strong "Right to Non-Discrimination."
          text " This right stems from the CCPA. We do not and will not charge you a different amount to use our products, offer you different discounts, or give you a lower level of customer service because you have exercised your data privacy rights. However, the exercise of certain rights (such as the right “to be forgotten”) may, by virtue of your exercising those rights, prevent you from using our Services."
        end
      end

      para "Many of these rights can be exercised by signing in and directly updating your account information."

      para do
        text "If you have questions about exercising these rights or need assistance, please contact us at "
        a Application.settings.support_email.address, href: "mailto:#{Application.settings.support_email}"
        text ". For requests to delete personal information or know what personal information has been collected, we will first verify your identity using a combination of at least two pieces of information already collected including your user email address. If an authorized agent is corresponding on your behalf, we will first need written consent with a signature from the account holder before proceeding."
      end

      para do
        text "If you are in the EU, you can identify your specific authority to file a complaint or find out more about GDPR, at "
        a "https://edpb.europa.eu/about-edpb/board/members_en", href: "https://edpb.europa.eu/about-edpb/board/members_en"
        text "."
      end

      h2 "How we secure your data", id: "how-we-secure-your-data"

      para do
        text "All data is encrypted via "
        a "SSL/TLS", href: "https://en.wikipedia.org/wiki/Transport_Layer_Security"
        text " when transmitted from our servers to your browser."
      end

      para do
        text "Most data are not encrypted while they live in our database (since it needs to be ready to send to you when you need it), but we go to great lengths to secure your data at rest."
      end

      h2 "Location of site and data", id: "location-of-site-and-data"

      para do
        text "Our products and other web properties are operated in the United States. If you are located in the European Union or elsewhere outside of the United States, "
        strong "please be aware that any information you provide to us will be transferred to and stored in the United States"
        text ". By using our Site, participating in any of our services and/or providing us with your information, you consent to this transfer."
      end

      h2 "Changes & questions", id: "changes-questions"

      para do
        text "We may update this policy as needed to comply with relevant regulations and reflect any new practices. You can monitor this page for change to the updated timestamp at the top of the page. Whenever we make a significant change to our policies, we may also announce them on product and service websites."
      end

      para do
        text "Have any questions, comments, or concerns about this privacy policy, your data, or your rights with respect to your information? Please get in touch by emailing us at "
        a Application.settings.support_email.address, href: "mailto:#{Application.settings.support_email}"
        text " and we’ll be happy to answer them!"
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
