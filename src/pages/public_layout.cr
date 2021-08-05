abstract class PublicLayout
  include Lucky::HTMLPage

  # For our public layout, a user may or may not be present.
  needs current_user : User?

  abstract def content
  abstract def page_title

  def render
    html_doctype

    html lang: "en" do
      mount Shared::LayoutHead, page_title: page_title

      body class: "min-h-screen flex flex-col bg-gray-100" do
        mount Shared::FlashMessages, context.flash
        mount Shared::Navbar, user: current_user

        main class: "flex-1" do
          div class: "max-w-7xl mx-auto py-6 sm:px-6 lg:px-8" do
            content
          end
        end

        mount Shared::Footer
      end
    end
  end
end
