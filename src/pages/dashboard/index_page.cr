class Dashboard::IndexPage < MainLayout
  needs categories : CategoryQuery

  def page_title
    "Dashboard"
  end

  def content
    div class: "bg-white overflow-hidden shadow rounded-lg" do
      div class: "border-b border-gray-200 px-4 py-5 sm:px-6" do
        div class: "-ml-4 -mt-2 flex items-center justify-between flex-wrap sm:flex-nowrap" do
          div class: "ml-4 mt-2" do
            h3 class: "text-lg leading-6 font-medium text-gray-900" do
              text "Welcome back, #{current_user.first_name || current_user.email}!"
            end
          end
          div class: "ml-4 mt-2 flex-shrink-0 flex space-x-3" do
            mount UI::Button, &.link "Export filters to XML", to: Filters::Index
            mount UI::Button, &.link "New category", to: Categories::New
          end
        end
      end

      div class: "px-4 py-5 sm:p-6" do
        if categories.empty?
          render_create_category
        else
          render_categories
        end
      end
    end
  end

  private def render_categories
    ul class: "space-y-10" do
      categories.each do |category|
        li do
          div class: "bg-gray-200 px-4 py-2 rounded-lg flex justify-between items-center" do
            h3 class: "text-lg leading-6 font-medium text-gray-900" do
              text category.label
            end

            div class: "flex space-x-2" do
              mount UI::Button, size: UI::Button::Size::Small, &.link to: Filters::New.with(default_category: category.id) do
                render_plus_icon
              end

              mount UI::Button, size: UI::Button::Size::Small, &.link to: Categories::Edit.with(category) do
                render_edit_icon
              end

              mount UI::Button, size: UI::Button::Size::Small, &.link to: Categories::Delete.with(category), data_confirm: "Are you sure?" do
                render_delete_icon
              end
            end
          end

          div class: "mt-3 grid grid-cols-1 gap-4 sm:grid-cols-2" do
            if category.filters.empty?
              h2 "Get started by creating a filter for this category.", class: "ml-4 font-medium"
            else
              category.filters.each do |filter|
                render_filter(filter)
              end
            end
          end
        end
      end
    end
  end

  private def render_create_category
    div class: "my-10 mx-auto text-center" do
      div "👋", class: "text-xl"

      h1 "Hey, there! You don't have any categories yet.", class: "my-4 text-lg font-medium"

      h2 do
        mount UI::Button, &.link "Try creating one now", to: Categories::New
      end
    end
  end

  private def render_delete_icon
    tag "svg", class: "h-5 w-5", fill: "currentColor", viewBox: "0 0 20 20", xmlns: "http://www.w3.org/2000/svg" do
      tag "path", clip_rule: "evenodd", d: "M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z", fill_rule: "evenodd"
    end
  end

  private def render_edit_icon
    tag "svg", class: "h-5 w-5", fill: "currentColor", viewBox: "0 0 20 20", xmlns: "http://www.w3.org/2000/svg" do
      tag "path", d: "M17.414 2.586a2 2 0 00-2.828 0L7 10.172V13h2.828l7.586-7.586a2 2 0 000-2.828z"
      tag "path", clip_rule: "evenodd", d: "M2 6a2 2 0 012-2h4a1 1 0 010 2H4v10h10v-4a1 1 0 112 0v4a2 2 0 01-2 2H4a2 2 0 01-2-2V6z", fill_rule: "evenodd"
    end
  end

  private def render_plus_icon
    tag "svg", class: "h-5 w-5", fill: "currentColor", viewBox: "0 0 20 20", xmlns: "http://www.w3.org/2000/svg" do
      tag "path", clip_rule: "evenodd", d: "M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z", fill_rule: "evenodd"
    end
  end

  private def render_filter(filter : Filter)
    div class: "relative rounded-lg border border-gray-300 bg-white px-6 py-5 shadow-sm flex items-center space-x-3 hover:border-gray-400 focus-within:ring-2 focus-within:ring-offset-2 focus-within:ring-primary-500" do
      div class: "flex-shrink-0" do
        div class: "h-10 w-10 bg-primary-600 rounded-full flex items-center justify-center" do
          render_filter_icon
        end
      end
      div class: "flex-1 min-w-0" do
        link to: Filters::Show.with(filter.id), class: "focus:outline-none" do
          span aria_hidden: "true", class: "absolute inset-0"
          para class: "text-sm font-medium text-gray-900" do
            text filter.name
          end
          para class: "text-sm text-gray-500 truncate" do
            text filter.search_query
          end
        end
      end
    end
  end

  private def render_filter_icon
    tag "svg", class: "text-white h-5 w-5", fill: "currentColor", viewBox: "0 0 20 20", xmlns: "http://www.w3.org/2000/svg" do
      tag "path", d: "M5 4a1 1 0 00-2 0v7.268a2 2 0 000 3.464V16a1 1 0 102 0v-1.268a2 2 0 000-3.464V4zM11 4a1 1 0 10-2 0v1.268a2 2 0 000 3.464V16a1 1 0 102 0V8.732a2 2 0 000-3.464V4zM16 3a1 1 0 011 1v7.268a2 2 0 010 3.464V16a1 1 0 11-2 0v-1.268a2 2 0 010-3.464V4a1 1 0 011-1z"
    end
  end
end
