class Shared::Navbar < BaseComponent
  needs user : User?
  needs simple : Bool = false

  def render
    nav class: "bg-white shadow-sm z-50", data_controller: "toggle" do
      div class: "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8" do
        div class: "flex justify-between items-center h-16" do
          render_left_navbar

          unless simple?
            render_right_navbar(user)
          end

          div class: "-mr-2 flex items-center sm:hidden", data_action: "click->toggle#toggle click@window->toggle#clickOutside" do
            render_hamburger_icon
          end
        end
      end

      div class: "hidden sm:hidden", aria_expanded: "false", aria_label: "Main menu", data_toggle_target: "toggleable" do
        render_hamburger_menu(user)
      end
    end
  end

  private def render_left_navbar
    div class: "flex" do
      div class: "flex-shrink-0 flex items-center" do
        render_logo
      end
    end
  end

  private def render_logo
    link "Better Gmail Filters", to: Home::Index, class: "leading-8 font-extrabold tracking-tight text-gray-900 text-xl sm:leading-10 hover:text-gray-600"
  end

  private def render_hamburger_icon
    button class: "inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 focus:text-gray-500 transition duration-150 ease-in-out", aria_label: "Open Menu" do
      tag "svg", class: "block h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
        tag "path", d: "M4 6h16M4 12h16M4 18h16", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
      end
      tag "svg", class: "hidden h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
        tag "path", d: "M6 18L18 6M6 6l12 12", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
      end
    end
  end

  private def render_hamburger_menu(user : User)
    div class: "pt-2 pb-3" do
      mount UI::NavbarHamburgerButton, &.link("My profile", to: Me::Edit, flow_id: "nav-hamburger-my-profile-button")

      unless user.subscription
        mount UI::NavbarHamburgerButton, &.link("Upgrade to pro", to: Subscriptions::Index, flow_id: "nav-hamburger-upgrade-button")
      end

      mount UI::NavbarHamburgerButton, &.link("Sign out", to: SignIns::Delete, flow_id: "nav-hamburger-sign-out-button")
    end
  end

  private def render_hamburger_menu(no_user : Nil)
    div class: "pt-2 pb-3" do
      mount UI::NavbarHamburgerButton, &.link("Home", to: Home::Index, flow_id: "nav-hamburger-home-button")
      mount UI::NavbarHamburgerButton, &.link("Sign in", to: SignIns::New, flow_id: "nav-hamburger-sign-in-button")
      mount UI::NavbarHamburgerButton, &.link("Sign up", to: SignIns::New, flow_id: "nav-hamburger-sign-up-button")
    end
  end

  private def render_right_navbar(user : User)
    div class: "hidden sm:flex items-center" do
      unless user.subscription
        div class: "flex-shrink-0" do
          mount UI::Button, &.link to: Subscriptions::Index, flow_id: "nav-pro-upgrade-button" do
            tag "svg", class: "mr-1 h-4 w-4", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
              tag "path", d: "M5 11l7-7 7 7M5 19l7-7 7 7", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
            end

            text "Upgrade to Pro"
          end
        end
      end

      div class: "ml-4 flex-shrink-0 flex items-center" do
        div class: "ml-3 relative", data_controller: "toggle" do
          div do
            button data_action: "click->toggle#toggle click@window->toggle#clickOutside", aria_haspopup: "true", class: "bg-gray-800 flex text-sm rounded-full focus:outline-none", id: "user-menu", flow_id: "nav-profile-button" do
              span "Open user menu", class: "sr-only"
              img alt: "", class: "h-8 w-8 rounded-full ring-2 ring-primary-600 hover:ring-primary-400 focus:ring-primary-400", src: user.image
            end
          end
          div data_toggle_target: "toggleable", aria_expanded: "false", aria_labelledby: "user-menu", aria_orientation: "vertical", class: "hidden z-50 origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg py-1 bg-white ring-1 ring-black ring-opacity-5", role: "menu" do
            link "Your profile", to: Me::Edit, class: "block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100", role: "menuitem"
            link "Sign out", to: SignIns::Delete, flow_id: "nav-sign-out-button", class: "block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100", role: "menuitem"
          end
        end
      end
    end
  end

  private def render_right_navbar(no_user : Nil)
    div class: "hidden sm:flex sm:space-x-2 items-center" do
      mount UI::Button, &.link("Sign up", to: SignIns::New, flow_id: "nav-sign-up-button")
      link "Sign in", to: SignIns::New, class: "text-gray-500 bg-gray-100 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-sm font-medium", flow_id: "nav-sign-in-button"
    end
  end
end
