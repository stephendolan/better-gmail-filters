class Filters::NewPage < MainLayout
  needs operation : SaveFilter
  quick_def page_title, "New Filter"

  def content
    div class: "bg-white overflow-hidden shadow sm:rounded-lg divide-y divide-gray-200" do
      div class: "px-4 py-5 sm:px-6" do
        h3 class: "text-lg leading-6 font-medium text-gray-900" do
          text "New filter"
        end
      end

      render_filter_form(operation)
    end
  end

  def render_filter_form(op)
    form_for Filters::Create, class: "divide-y divide-gray-200" do
      div class: "px-4 py-5 sm:p-6 space-y-4" do
        mount Filters::FormFields, op, current_user: current_user
      end

      div class: "px-4 py-4 sm:px-6" do
        mount UI::Button, &.submit "Create filter", data_disable_with: "Creating..."
      end
    end
  end
end
