class Filters::Index < BrowserAction
  get "/filters" do
    authorize

    filters = FilterQuery.new.creator_id(current_user.id)
    xml_data = FilterSerializer.for_collection(filters)

    data xml_data,
      disposition: "attachment",
      filename: "better-gmail-filters.xml",
      content_type: "text/xml"
  end
end
