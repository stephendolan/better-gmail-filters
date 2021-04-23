class Filters::Index < BrowserAction
  get "/filters" do
    filters = FilterQuery.new.preload_filter_placeholders.creator_id(current_user.id)
    xml_data = FilterSerializer.for_collection(filters)

    data xml_data,
      disposition: "attachment",
      filename: "better-gmail-filters.xml",
      content_type: "application/xml"
  end
end
