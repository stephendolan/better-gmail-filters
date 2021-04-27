class SaveFilterVariant < FilterVariant::SaveOperation
  needs filter : Filter
  needs variant_form_submission : FilterVariants::FormSubmission

  before_save do
    set_filter_id
    validate_variants
  end

  private def set_filter_id
    filter_id.value = filter.id
  end

  private def validate_variants
    if (variant_form_submission.placeholder_params.replacements.map(&.placeholder) - filter.placeholders).empty?
      replacements.value = JSON.parse(variant_form_submission.placeholder_params.to_json)
    else
      add_error(:invalid_keys, "Sorry, you need one value for each placeholder. No more, no less!")
    end
  end
end
