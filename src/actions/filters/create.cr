class Filters::Create < BrowserAction
  post "/filters" do
    SaveFilter.create(params) do |operation, filter|
      if filter
        redirect Filters::Show.with(filter.id)
      else
        html Filters::NewPage, operation: operation
      end
    end
  end
end
