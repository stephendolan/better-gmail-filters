class Filters::ShowPage < MainLayout
  needs filter : Filter
  quick_def page_title, "Filter with id: #{filter.id}"

  def content
    link "Back to all Filters", Home::Index
    h1 "Filter with id: #{filter.id}"
    render_actions
    render_filter_fields
  end

  def render_actions
    section do
      link "Edit", Filters::Edit.with(filter.id)
      text " | "
      link "Delete",
        Filters::Delete.with(filter.id),
        data_confirm: "Are you sure?"
    end
  end

  def render_filter_fields
    ul do
      li do
        text "name: "
        strong filter.name.to_s
      end
      li do
        text "search_query: "
        strong filter.search_query.to_s
      end
      li do
        text "category_id: "
        strong filter.category_id.to_s
      end
    end
  end
end
