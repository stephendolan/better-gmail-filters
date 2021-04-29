class FilterVariants::Update < BrowserAction
  post "/filter_variants/:filter_variant_id" do
    filter_variant = filter_variant_from_params(filter_variant_id)

    authorize filter_variant.filter

    variant_form_submission = FilterVariants::FormSubmission.new(params)

    SaveFilterVariant.update(filter_variant, params, filter: filter_variant.filter, variant_form_submission: variant_form_submission) do |_operation, variant|
      if filter_variant
        redirect Filters::Show.with(variant.filter_id)
      else
        flash.failure = "Something went wrong, please try again"
        redirect Filters::Show.with(variant.filter.id)
      end
    end
  end

  private def filter_variant_from_params(id : String)
    FilterVariantQuery.new.preload_filter(FilterQuery.new.preload_category).find(id)
  end
end
