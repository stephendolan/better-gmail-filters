class FilterPlaceholders::EditPage < MainLayout
  needs operation : SaveFilterPlaceholder
  needs filter_placeholder : FilterPlaceholder

  quick_def page_title, "Filter placeholder '#{filter_placeholder.name}' for filter '#{filter_placeholder.filter.name}'"

  def content
    div class: "bg-white overflow-hidden shadow rounded-lg divide-y divide-gray-200" do
      div class: "px-4 py-5 sm:px-6" do
        h3 class: "text-lg leading-6 font-medium text-gray-900" do
          text "Edit placeholder '#{filter_placeholder.name}' for filter '#{filter_placeholder.filter.name}'"
        end
      end

      render_form(operation)
    end
  end

  def render_form(op)
    form_for FilterPlaceholders::Update.with(filter_placeholder.id), class: "divide-y divide-gray-200" do
      div class: "px-4 py-5 sm:p-6" do
        mount FilterPlaceholders::FormFields, op
      end

      div class: "px-4 py-4 sm:px-6" do
        mount UI::Button, &.submit "Update placeholder", data_disable_with: "Updating..."
      end
    end
  end
end
