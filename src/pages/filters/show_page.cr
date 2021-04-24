class Filters::ShowPage < MainLayout
  needs filter : Filter
  quick_def page_title, filter.name

  def content
    div class: "bg-white overflow-hidden shadow sm:rounded-lg divide-y divide-gray-200" do
      div class: "flex justify-between items-center flex-wrap sm:flex-nowrap px-4 py-5 sm:px-6" do
        div class: "ml-4 mt-4" do
          h3 class: "text-lg leading-6 font-medium text-gray-900" do
            text filter.name
          end
          if (filter_category = filter.category)
            para class: "mt-1 text-sm text-gray-500" do
              text filter_category.label
            end
          end
        end

        div class: "flex-shrink-0 flex items-center space-x-3" do
          mount UI::Button, &.link "Edit", to: Filters::Edit.with(filter.id)
          mount UI::Button, &.link "Delete", to: Filters::Delete.with(filter.id), data_confirm: "Are you sure?"
        end
      end

      render_filter_fields
    end
  end

  def render_filter_fields
    section do
      div class: "bg-white shadow sm:rounded-lg" do
        div class: "px-4 py-5 sm:px-6" do
          dl class: "grid grid-cols-1 gap-x-4 gap-y-8 sm:grid-cols-2" do
            div class: "sm:col-span-2" do
              dt class: "text-sm font-medium text-gray-500" do
                text "Search query"
              end
              dd class: "mt-1 border-l-8 border-primary-600 bg-gray-50 py-2 pl-2 text-sm text-gray-900" do
                text filter.search_query
              end
            end

            div class: "sm:col-span-2" do
              dt class: "text-sm font-medium text-gray-500" do
                text "Parameters (#{pluralize(filter.search_permutations.size, "dynamic search")})"
              end
              dd class: "mt-1 py-2 text-sm text-gray-900 space-y-2" do
                filter.filter_placeholders.each do |placeholder|
                  div class: "max-w-lg flex rounded-md shadow-sm" do
                    link to: FilterPlaceholders::Edit.with(placeholder.id), class: "inline-flex items-center px-3 py-1 rounded-l-md border border-r-0 border-gray-300 bg-gray-50 hover:bg-gray-100 text-primary-700 hover:text-primary-900 sm:text-sm font-medium" do
                      text placeholder.name
                    end
                    span class: "flex-1 block px-3 py-1 rounded-r-md w-full min-w-0 sm:text-sm border border-gray-300" do
                      if placeholder.values.empty?
                        text "No value set"
                      else
                        text placeholder.values.join(", ")
                      end
                    end
                  end
                end
              end
            end

            div class: "sm:col-span-2" do
              dt class: "text-sm font-medium text-gray-500" do
                text "Actions"
              end
              dd class: "mt-1 text-sm text-gray-900" do
                ul class: "border border-gray-200 rounded-md divide-y divide-gray-200" do
                  li class: "pl-3 pr-4 py-3 flex items-center justify-between text-sm" do
                    div class: "w-0 flex-1 flex items-center" do
                      render_label_icon(filter.should_apply_label)

                      span class: "ml-2 flex-1 w-0 truncate space-x-1" do
                        if (label = filter.should_apply_label)
                          span "Apply label"
                          span label, class: "font-semibold"
                        else
                          span "Not applying labels"
                        end
                      end
                    end
                  end
                  li class: "pl-3 pr-4 py-3 flex items-center justify-between text-sm" do
                    div class: "w-0 flex-1 flex items-center" do
                      render_on_off_icon(filter.should_mark_as_read)

                      span class: "ml-2 flex-1 w-0 truncate" do
                        text "Mark as read"
                      end
                    end
                  end
                  li class: "pl-3 pr-4 py-3 flex items-center justify-between text-sm" do
                    div class: "w-0 flex-1 flex items-center" do
                      render_on_off_icon(filter.should_archive)

                      span class: "ml-2 flex-1 w-0 truncate" do
                        text "Send to archive"
                      end
                    end
                  end
                  li class: "pl-3 pr-4 py-3 flex items-center justify-between text-sm" do
                    div class: "w-0 flex-1 flex items-center" do
                      render_on_off_icon(filter.should_star)

                      span class: "ml-2 flex-1 w-0 truncate" do
                        text "Mark as starred"
                      end
                    end
                  end
                  li class: "pl-3 pr-4 py-3 flex items-center justify-between text-sm" do
                    div class: "w-0 flex-1 flex items-center" do
                      render_on_off_icon(filter.should_never_mark_spam)

                      span class: "ml-2 flex-1 w-0 truncate" do
                        text "Never mark as spam"
                      end
                    end
                  end
                  li class: "pl-3 pr-4 py-3 flex items-center justify-between text-sm" do
                    div class: "w-0 flex-1 flex items-center" do
                      render_on_off_icon(filter.should_mark_important)

                      span class: "ml-2 flex-1 w-0 truncate" do
                        text "Mark as important"
                      end
                    end
                  end
                  li class: "pl-3 pr-4 py-3 flex items-center justify-between text-sm" do
                    div class: "w-0 flex-1 flex items-center" do
                      render_forward_icon(filter.should_forward_to)

                      span class: "ml-2 flex-1 w-0 truncate space-x-1" do
                        if (forward_address = filter.should_forward_to)
                          span "Forward to"
                          span forward_address, class: "font-semibold"
                        else
                          span "Not forwarding"
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  private def render_label_icon(value : String?)
    color = if value
              "text-green-400"
            else
              "text-gray-300"
            end

    tag "svg", class: "flex-shrink-0 h-5 w-5 #{color}", fill: "currentColor", viewBox: "0 0 20 20", xmlns: "http://www.w3.org/2000/svg" do
      tag "path", clip_rule: "evenodd", d: "M17.707 9.293a1 1 0 010 1.414l-7 7a1 1 0 01-1.414 0l-7-7A.997.997 0 012 10V5a3 3 0 013-3h5c.256 0 .512.098.707.293l7 7zM5 6a1 1 0 100-2 1 1 0 000 2z", fill_rule: "evenodd"
    end
  end

  private def render_forward_icon(value : String?)
    color = if value
              "text-green-400"
            else
              "text-gray-300"
            end

    tag "svg", class: "flex-shrink-0 h-5 w-5 #{color}", fill: "currentColor", viewBox: "0 0 20 20", xmlns: "http://www.w3.org/2000/svg" do
      tag "path", clip_rule: "evenodd", d: "M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.707l-3-3a1 1 0 00-1.414 1.414L10.586 9H7a1 1 0 100 2h3.586l-1.293 1.293a1 1 0 101.414 1.414l3-3a1 1 0 000-1.414z", fill_rule: "evenodd"
    end
  end

  private def render_on_off_icon(flag_value : Bool)
    if flag_value
      tag "svg", class: "flex-shrink-0 h-5 w-5 text-green-400", fill: "currentColor", viewBox: "0 0 20 20", xmlns: "http://www.w3.org/2000/svg" do
        tag "path", clip_rule: "evenodd", d: "M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z", fill_rule: "evenodd"
      end
    else
      tag "svg", class: "flex-shrink-0 h-5 w-5 text-gray-300", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
        tag "path", d: "M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
      end
    end
  end
end
