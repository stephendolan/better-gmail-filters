class Support::IndexPage < MainLayout
  def page_title
    "Support"
  end

  def page_description
    "Get help with your #{Application.settings.name} account"
  end

  def content
    section class: "max-w-5xl mx-auto py-6 sm:px-6 lg:px-8" do
      mount UI::Card,
        title: page_title,
        body: ->{ render_support_content }
    end
  end

  private def render_support_content
    div class: "text-center space-y-2" do
      h1 "Looking for help?", class: "text-lg font-semibold text-center"

      div class: "space-y-1" do
        para "The best way to get ahold of us is via email!"

        para do
          text "The quickest way to make that happen is to "
          a "click this link", href: "mailto:#{Application.settings.support_email}", class: "hover:text-gray-700 underline", title: "Email #{Application.settings.name} support"
          text " to email #{Application.settings.support_email.address}."
        end

        para "We don't have a fancy ticketing system or anything, but you'll hear back from a real human soon, we promise!"
      end
    end
  end
end
