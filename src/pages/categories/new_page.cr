class Categories::NewPage < MainLayout
  needs operation : SaveCategory
  quick_def page_title, "New Category"

  def content
    div class: "bg-white overflow-hidden shadow rounded-lg divide-y divide-gray-200" do
      div class: "px-4 py-5 sm:px-6" do
        h3 class: "text-lg leading-6 font-medium text-gray-900" do
          text "New category"
        end
      end

      render_category_form(operation)
    end
  end

  def render_category_form(op)
    form_for Categories::Create, class: "divide-y divide-gray-200" do
      div class: "px-4 py-5 sm:p-6" do
        mount Categories::FormFields, op
      end

      div class: "px-4 py-4 sm:px-6" do
        mount UI::Button, &.submit "Create category", data_disable_with: "Creating..."
      end
    end
  end
end
