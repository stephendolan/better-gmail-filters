class FilterPlaceholders::FormFields < BaseComponent
  needs operation : SaveFilterPlaceholder

  def render
    initial_value = if (current_values = operation.values.value)
                      current_values.map(&.strip).join(", ")
                    else
                      ""
                    end

    mount Shared::Field, operation.value_string, "Placeholder values (comma-separated)", &.text_input(autofocus: "true", value: initial_value)
  end
end
