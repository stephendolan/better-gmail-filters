class FilterVariants::FormFields < BaseComponent
  needs filter : Filter

  def render
    # We have to render this so that Lucky sees a valid FilterVariant form
    input type: "hidden", name: "filter_variant:unused"

    filter.placeholders.each do |placeholder|
      label placeholder, for: "placeholder:#{placeholder}", class: label_classes
      input type: "text", value: "Boop", name: "placeholder:#{placeholder}", attrs: [:required], class: input_classes
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
