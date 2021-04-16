class Categories::EditPage < MainLayout
  needs operation : SaveCategory
  needs category : Category
  quick_def page_title, "Edit Category with id: #{category.id}"

  def content
    div class: "bg-white overflow-hidden shadow rounded-lg divide-y divide-gray-200" do
      div class: "px-4 py-5 sm:px-6" do
        h3 class: "text-lg leading-6 font-medium text-gray-900" do
          text "Edit category '#{category.label}'"
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
        mount UI::Button, &.submit "Update category", data_disable_with: "Updating..."
      end
    end
  end
end
