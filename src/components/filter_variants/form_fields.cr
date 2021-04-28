class FilterVariants::FormFields < BaseComponent
  needs filter : Filter

  def render
    # We have to render this so that Lucky sees a valid FilterVariant form
    input type: "hidden", name: "filter_variant:unused"

    filter.placeholders.each_with_index do |placeholder, index|
      attributes = [:required]
      attributes.push(:autofocus) if index == 0

      label placeholder, for: "placeholder:#{placeholder}", class: label_classes
      input type: "text", name: "placeholder:#{placeholder}", attrs: attributes, class: input_classes
    end
  end

  private def input_classes
    base_classes = "block w-full sm:text-sm rounded-md"

    "#{base_classes} focus:ring-primary-500 focus:border-primary-500 border-gray-300"
  end

  private def label_classes
    "block text-sm font-medium text-gray-700"
  end
end
