class FilterVariants::Delete < BrowserAction
  delete "/filter_variants/:filter_variant_id" do
    filter_variant = FilterVariantQuery.new.preload_filter.find(filter_variant_id)
    authorize filter_variant.filter

    filter_variant.delete
    redirect Filters::Show.with(filter_variant.filter_id)
  end
end
