class Filters::FormFields < BaseComponent
  needs operation : SaveFilter

  def render
    mount Shared::Field, operation.name, &.text_input(autofocus: "true")

    mount Shared::Field, operation.category_id do |input_html|
      input_html.select_input do
        select_prompt("Select category") if operation.category_id.nil?
        options_for_select(operation.category_id, category_options)
      end
    end

    mount Shared::Field, operation.search_query, &.textarea
  end

  private def category_options
    CategoryQuery.new.map do |category|
      {category.label, category.id}
    end
  end
end
