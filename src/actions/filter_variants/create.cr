class FilterVariants::Create < BrowserAction
  post "/filters/:filter_id/filter_variants" do
    authorize

    variant_form_submission = FilterVariants::FormSubmission.new(params)
    filter = filter_from_params(filter_id)

    SaveFilterVariant.create(params, filter: filter, variant_form_submission: variant_form_submission) do |_operation, filter_variant|
      if filter_variant
        redirect Filters::Show.with(filter_variant.filter_id)
      else
        flash.failure = "Something went wrong, please try again"
        redirect Filters::Show.with(filter.id)
      end
    end
  end

  private def filter_from_params(id : String)
    FilterQuery.new.preload_category.preload_variants.find(id)
  end
end
