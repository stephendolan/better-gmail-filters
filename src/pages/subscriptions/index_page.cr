class Subscriptions::IndexPage < AuthLayout
  def page_title
    "Pricing"
  end

  def page_description
    "Upgrade to #{Application.settings.name} Pro for unlimited filters, categories, and options!"
  end

  def content
    div class: "bg-primary-800" do
      div class: "py-8 sm:py-12 lg:py-16 shadow-md" do
        render_header
      end

      div class: "pt-8 pb-12 bg-primary-500 sm:pt-12 sm:pb-16 lg:pt-16 lg:pb-24" do
        div class: "relative" do
          div class: "relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8" do
            div class: "max-w-md mx-auto space-y-4 lg:max-w-5xl lg:grid lg:grid-cols-2 lg:gap-5 lg:space-y-0" do
              div class: "flex flex-col rounded-lg shadow-lg overflow-hidden" do
                div class: "px-6 py-8 bg-white sm:p-10 sm:pb-6" do
                  div do
                    h3 class: "inline-flex px-4 py-1 rounded-full text-sm font-semibold tracking-wide uppercase bg-primary-100 text-primary-700" do
                      text "Monthly"
                    end
                  end
                  div class: "mt-4 flex items-baseline text-6xl font-extrabold" do
                    text render_dollars_from_cents(Subscription::Monthly.price_cents)
                    span class: "ml-1 text-2xl font-medium text-gray-500" do
                      text "/month"
                    end
                  end
                  para class: "mt-5 text-lg text-gray-500" do
                    text "Kick the tires without committing."
                  end
                end
                div class: "flex-1 flex flex-col justify-between px-6 pt-6 pb-8 bg-gray-50 space-y-6 sm:p-10 sm:pt-6" do
                  render_pro_plan_benefits

                  if current_user
                    render_subscription_button(Subscription::Monthly.stripe_price_id)
                  else
                    render_sign_up_button
                  end
                end
              end
              div class: "flex flex-col rounded-lg shadow-lg overflow-hidden" do
                div class: "px-6 py-8 bg-white sm:p-10 sm:pb-6" do
                  div class: "flex justify-between" do
                    h3 class: "inline-flex px-4 py-1 rounded-full text-sm font-semibold tracking-wide uppercase bg-primary-100 text-primary-600" do
                      text "Yearly"
                    end

                    h3 class: "inline-flex px-4 py-1 rounded-full text-sm font-semibold tracking-wide uppercase bg-primary-500 text-white" do
                      text "37% cheaper"
                    end
                  end
                  div class: "mt-4 flex items-baseline text-6xl font-extrabold" do
                    text render_dollars_from_cents(Subscription::Annual.price_cents)
                    span class: "ml-1 text-2xl font-medium text-gray-500" do
                      text "/year"
                    end
                  end
                  para class: "mt-5 text-lg text-gray-500" do
                    text "Our most cost-effective plan."
                  end
                end
                div class: "flex-1 flex flex-col justify-between px-6 pt-6 pb-8 bg-gray-50 space-y-6 sm:p-10 sm:pt-6" do
                  render_pro_plan_benefits

                  if current_user
                    render_subscription_button(Subscription::Annual.stripe_price_id)
                  else
                    render_sign_up_button
                  end
                end
              end
            end
          end
        end
        div class: "mt-4 relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 lg:mt-5" do
          div class: "max-w-md mx-auto lg:max-w-5xl" do
            div class: "rounded-lg bg-gray-100 px-6 py-8 sm:p-10 lg:flex lg:items-center" do
              div class: "flex-1" do
                div do
                  h3 class: "inline-flex px-4 py-1 rounded-full text-sm font-semibold tracking-wide uppercase bg-white text-primary" do
                    text "Stay on the free plan"
                  end
                end
                div class: "mt-4 text-lg text-gray-600" do
                  text "There's plenty of room to add filters in the free tier, too!"
                end
              end
              div class: "mt-6 rounded-md shadow lg:mt-0 lg:ml-10 lg:flex-shrink-0" do
                link "Keep creating filters", Home::Index, class: "flex items-center justify-center px-5 py-3 border border-transparent text-base font-medium rounded-md text-primary-800 bg-white hover:bg-gray-50"
              end
            end
          end
        end
      end
    end
  end

  private def render_checkmark_icon
    tag "svg", aria_hidden: "true", class: "h-6 w-6 text-primary-500", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
      tag "path", d: "M5 13l4 4L19 7", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
    end
  end

  private def render_pro_plan_benefits
    benefits = [
      "Unlimited filters",
      "Unlimited dynamic filter variants",
      "Unlimited filter categories",
    ]

    ul class: "space-y-4" do
      benefits.each do |benefit|
        li class: "flex items-start" do
          div class: "flex-shrink-0" do
            render_checkmark_icon
          end

          para class: "ml-3 text-base text-gray-700" do
            text benefit
          end
        end
      end
    end
  end

  private def render_header
    div class: "max-w-7xl mx-auto text-center px-4 sm:px-6 lg:px-8" do
      div class: "max-w-3xl mx-auto space-y-2 lg:max-w-none" do
        h2 class: "text-lg leading-6 font-semibold text-gray-300 uppercase tracking-wider" do
          text "Upgrade to Pro"
        end
        para class: "text-3xl font-extrabold text-white sm:text-4xl lg:text-5xl" do
          text "Unlimited everything"
        end
        para class: "text-xl text-gray-300" do
          text "Create as many filters, categories, and dynamic placeholders as you need!"
        end
      end
    end
  end

  private def render_subscription_button(stripe_price_id : String, button_text : String? = "Get started")
    is_disabled = false
    button_action = "redirectToCheckout"

    if (user = current_user)
      if (subscription = user.subscription)
        button_action = "redirectToBillingPortal"

        if subscription.is_active?
          if subscription.stripe_data.dig("plan", "id") == stripe_price_id
            is_disabled = true
          else
            button_text = "Switch your plan"
          end
        end
      end
    end

    if is_disabled
      div "This is your current plan",
        class: "flex items-center justify-center py-3 text-base font-medium text-gray-700 underline"
    else
      button button_text,
        class: "flex items-center justify-center px-5 py-3 border border-transparent text-base font-medium rounded-md shadow text-white bg-primary-800 hover:bg-secondary-800",
        flow_id: "stripe-link-#{button_action}",
        data_controller: "stripe",
        data_action: "click->stripe##{button_action}",
        data_stripe_price_value: stripe_price_id
    end
  end

  private def render_sign_up_button
    link "Get started", SignIns::New, class: "flex items-center justify-center px-5 py-3 border border-transparent text-base font-medium rounded-md shadow text-white bg-primary-800 hover:bg-secondary-800", flow_id: "guest-subscription-sign-up-button"
  end

  private def render_dollars_from_cents(cents : Int)
    dollars = cents // 100
    cents = cents % 100

    if cents == 0
      "$#{dollars}"
    else
      "$#{dollars}.#{cents.to_s.rjust(2, '0')}"
    end
  end
end
