class FilterPlaceholders::FormFields < BaseComponent
  needs operation : SaveFilterPlaceholder

  def render
    div class: "space-y-4" do
      if (filter_placeholder = operation.record)
        mount Shared::Field, operation.readonly_name, "Name", &.text_input(attrs: [:disabled], value: filter_placeholder.name, append_class: "bg-gray-50")
      end

      initial_value = if (current_values = operation.values.value)
                        current_values.map(&.strip).join(", ")
                      else
                        ""
                      end

      mount Shared::Field, operation.value_list, "Placeholder values (comma-separated)", &.text_input(autofocus: "true", value: initial_value)
      small "Enter up to 10 values like '1, 2, 3'", class: "ml-2 text-primary-700 font-medium"
    end
  end
end
