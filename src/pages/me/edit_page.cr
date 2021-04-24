class Me::EditPage < MainLayout
  needs operation : SaveUserSettings
  needs user : User

  def page_title
    "Your Profile"
  end

  def content
    section class: "max-w-7xl mx-auto py-6 sm:px-6 lg:px-8" do
      div class: "bg-white overflow-hidden shadow rounded-none sm:rounded-lg" do
        div class: "px-4 py-5 border-b border-gray-200 sm:px-6" do
          div class: "-ml-4 -mt-2 flex items-center justify-between flex-wrap sm:flex-nowrap" do
            div class: "ml-4 mt-2" do
              h1 class: "text-lg leading-6 font-medium text-gray-900" do
                text "Your profile"
              end
            end
          end
        end

        div do
          render_settings_page
        end
      end
    end
  end

  private def render_user_form
    form_for Me::Update do
      div class: "space-y-6 px-4 sm:px-6 pb-6" do
        mount Users::FormFields, operation

        mount UI::Button, &.submit("Update my settings", flow_id: "submit-user-button", data_disable_with: "Updating...")
      end
    end
  end

  private def render_settings_page
    render_basic_info_header
    render_user_form

    render_connected_accounts_header
    render_connected_accounts

    render_subscription_details_header
    render_subscription_details
  end

  private def render_basic_info_header
    div class: "flex items-center space-x-2 px-4 sm:px-6 border-b py-4 bg-gray-50" do
      figure do
        img src: user.image, class: "w-12 h-auto rounded-full"
      end

      div class: "flex-1" do
        h2 "Basic information", class: "text-lg leading-6 font-medium text-gray-900"
        para class: "mt-1 text-sm text-gray-500" do
          text " This information will be displayed publicly so be careful what you share. "
        end
      end
    end
  end

  private def render_subscription_details_header
    div class: "px-4 sm:px-6 border-t border-b py-4 bg-gray-50" do
      h3 class: "text-lg leading-6 font-medium text-gray-900" do
        text "Subscription details"
      end
      para class: "mt-1 max-w-2xl text-sm text-gray-500" do
        text "Upgrade to a paid plan, or manage your existing subscription"
      end
    end
  end

  private def render_connected_accounts_header
    div class: "px-4 sm:px-6 border-t border-b py-4 bg-gray-50" do
      h3 class: "text-lg leading-6 font-medium text-gray-900" do
        text "Connected accounts"
      end
      para class: "mt-1 max-w-2xl text-sm text-gray-500" do
        text "Manage integrations between #{Application.settings.name} and other services"
      end
    end
  end

  private def render_subscription_details
    div class: "px-4 sm:px-6 py-6 space-y-6" do
      if (subscription = user.subscription)
        stripe_subscription = Stripe::Subscription.from_json(subscription.stripe_data.to_json)

        dl class: "grid grid-cols-1 gap-x-4 gap-y-6 sm:grid-cols-2" do
          div class: "sm:col-span-1" do
            dt "Status", class: "text-sm font-medium text-gray-500"
            dd class: "mt-1 text-sm text-gray-900" do
              text stripe_subscription.status.to_s

              if (cancellation_time = stripe_subscription.cancel_at)
                text " (cancels on #{TimeDecorator.new(cancellation_time).date})"
              end
            end
          end

          div class: "sm:col-span-1" do
            dt "Current Billing Period", class: "text-sm font-medium text-gray-500"
            dd class: "mt-1 text-sm text-gray-900" do
              text TimeDecorator.new(stripe_subscription.current_period_start).date
              text " - "
              text TimeDecorator.new(stripe_subscription.current_period_end).date
            end
          end

          div class: "sm:col-span-1" do
            dt "Latest Invoice", class: "text-sm font-medium text-gray-500"
            dd class: "mt-1 text-sm text-gray-900" do
              render_invoice_information(stripe_subscription)
            end
          end

          div class: "sm:col-span-1" do
            dt class: "text-sm font-medium text-gray-500" do
              text "Need help?"
            end
            dd class: "mt-1 text-sm underline text-gray-900 hover:text-gray-700" do
              a "Send us an email", href: "mailto:#{Application.settings.support_email}?subject=#{Application.settings.name} Subscription"
            end
          end
        end

        mount UI::Button, &.button("Manage my subscription", data_controller: "stripe", data_action: "click->stripe#redirectToBillingPortal")
      else
        div class: "text-sm" do
          text "No subscription found, but you should "
          link "check out our pricing plans", Subscriptions::Index, class: "hover:text-gray-700 underline"
          text "!"
        end
      end
    end
  end

  private def render_invoice_information(stripe_subscription)
    invoice = Stripe::Invoice.retrieve(stripe_subscription.latest_invoice.to_s)

    if (invoice_url = invoice.hosted_invoice_url)
      a "View in Stripe",
        class: "underline hover:text-gray-700",
        href: invoice_url,
        target: "_blank", rel: "noopener",
        title: "View invoice in Stripe"
    else
      text "Could not load invoice"
    end
  end

  private def render_connected_accounts
    div class: "px-4 sm:px-6 py-6" do
      para "Google - Connected", class: "text-sm font-medium text-gray-500"

      link OAuth::Google::Disconnect, alt: "Disconnect your Google account", data_confirm: google_disconnect_confirmation_message, class: connection_button_classes do
        span "Disconnect your "
        span "Google", class: "sr-only"
        render_google_logo
        span "account"
      end
    end
  end

  private def render_google_logo
    tag "svg", class: "w-5 h-5", viewBox: "0 0 48 48", xlink: "http://www.w3.org/1999/xlink", xmlns: "http://www.w3.org/2000/svg" do
      tag "defs" do
        tag "path", d: "M44.5 20H24v8.5h11.8C34.7 33.9 30.1 37 24 37c-7.2 0-13-5.8-13-13s5.8-13 13-13c3.1 0 5.9 1.1 8.1 2.9l6.4-6.4C34.6 4.1 29.6 2 24 2 11.8 2 2 11.8 2 24s9.8 22 22 22c11 0 21-8 21-22 0-1.3-.2-2.7-.5-4z", id: "a"
      end
      tag "clipPath", id: "b" do
        tag "use", href: "#a", overflow: "visible"
      end
      tag "path", clip_path: "url(#b)", d: "M0 37V11l17 13z", fill: "#FBBC05"
      tag "path", clip_path: "url(#b)", d: "M0 11l17 13 7-6.1L48 14V0H0z", fill: "#EA4335"
      tag "path", clip_path: "url(#b)", d: "M0 37l30-23 7.9 1L48 0v48H0z", fill: "#34A853"
      tag "path", clip_path: "url(#b)", d: "M48 48L17 24l-4-3 35-10z", fill: "#4285F4"
    end
  end

  private def google_disconnect_confirmation_message
    <<-MESSAGE.gsub("\n", "")
      Are you sure you want to disconnect from Google?
      We're going to redirect you to Google.com to finish up there.
      You can always log in again using Google to reconnect!
      MESSAGE
  end

  private def connection_button_classes
    "mt-1 w-full inline-flex justify-center py-2 px-4 space-x-2 border border-gray-300 rounded-md shadow-sm bg-white text-sm font-medium text-gray-500 hover:bg-gray-50"
  end
end
