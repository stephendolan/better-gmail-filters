class FilterPlaceholders::Update < BrowserAction
  put "/filter_placeholders/:filter_placeholder_id" do
    placeholder = find_placeholder
    authorize placeholder

    SaveFilterPlaceholder.update(placeholder, params, filter: placeholder.filter, current_user: current_user) do |operation, updated_filter_placeholder|
      if operation.saved?
        redirect Filters::Show.with(updated_filter_placeholder.filter_id)
      else
        html FilterPlaceholders::EditPage, operation: operation, filter_placeholder: updated_filter_placeholder
      end
    end
  end

  private def find_placeholder
    FilterPlaceholderQuery.new
      .preload_filter(FilterQuery.new
        .preload_creator(UserQuery.new
          .preload_filters(FilterQuery.new
            .preload_filter_placeholders
          )
        )
      ).find(filter_placeholder_id)
  end
end
