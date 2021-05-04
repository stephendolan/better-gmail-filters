class Filters::Export < BrowserAction
  get "/filters/:filter_id/export" do
    filter = FilterQuery.find(filter_id)

    authorize filter

    xml_data = FilterSerializer.new(filter).render

    data xml_data,
      disposition: "attachment",
      filename: "better-gmail-filters.xml",
      content_type: "text/xml"
  end
end
