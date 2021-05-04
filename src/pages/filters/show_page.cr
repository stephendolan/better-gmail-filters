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
            para class: "mt-1 flex space-x-1 text-sm text-gray-500" do
              tag "svg", class: "h-5 w-5", fill: "currentColor", viewBox: "0 0 20 20", xmlns: "http://www.w3.org/2000/svg" do
                tag "path", d: "M2 6a2 2 0 012-2h5l2 2h5a2 2 0 012 2v6a2 2 0 01-2 2H4a2 2 0 01-2-2V6z"
              end

              span filter_category.label
            end
          end
        end

        div class: "flex-shrink-0 flex items-center space-x-3" do
          mount UI::Button, &.link "Export", to: Filters::Export.with(filter.id)
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
          dl class: "grid grid-cols-1 gap-x-4 gap-y-6 sm:grid-cols-2" do
            div class: "sm:col-span-2" do
              dt class: "text-sm font-medium text-gray-500" do
                text "Gmail search query"
              end
              dd class: "mt-1 rounded-l shadow-sm border-l-8 border-primary-600 bg-gray-50 py-3 pl-2 text-sm font-medium text-gray-900" do
                text filter.search_query
              end
            end

            if filter.placeholders.empty?
              dt class: "text-sm font-medium text-gray-500" do
                text "No placeholders. Use '{{ my_placeholder }}' in your search query to create some!"
              end
            else
              div class: "sm:col-span-2" do
                dt class: "text-sm font-medium text-gray-500" do
                  text "Placeholders"
                end
                dd class: "mt-1 py-2 text-sm text-gray-900 space-y-2" do
                  ul class: "flex flex-wrap space-x-2" do
                    filter.placeholders.each do |placeholder|
                      li class: "inline-flex items-center px-3 py-1 border border-gray-300 bg-gray-50 text-primary-700 sm:text-sm font-medium rounded-md shadow-sm" do
                        text placeholder
                      end
                    end
                  end
                end
              end

              div data_controller: "modal", class: "sm:col-span-2" do
                dt class: "text-sm font-medium text-gray-500 flex items-center space-x-1" do
                  span "Variants"

                  if FilterPolicy.new(current_user).create?
                    tag "svg", data_action: "click->modal#show", class: "h-5 w-5 cursor-pointer text-primary-600 hover:text-primary-500", fill: "currentColor", viewBox: "0 0 20 20", xmlns: "http://www.w3.org/2000/svg" do
                      tag "path", clip_rule: "evenodd", d: "M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z", fill_rule: "evenodd"
                    end
                  else
                    tag "svg", class: "h-5 w-5 cursor-disabled text-gray-300", fill: "currentColor", viewBox: "0 0 20 20", xmlns: "http://www.w3.org/2000/svg" do
                      tag "path", clip_rule: "evenodd", d: "M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z", fill_rule: "evenodd"
                    end

                    div do
                      span "("
                      link "Upgrade", to: Subscriptions::Index, class: "text-primary-600 hover:text-primary-500 underline"
                      span " for unlimited variants)"
                    end
                  end
                end
                dd class: "mt-1 py-2 text-sm text-gray-900 space-y-2" do
                  ul class: "space-y-2" do
                    if filter.variants.empty? && FilterPolicy.new(current_user).create?
                      div class: "text-sm font-medium text-gray-500" do
                        span "You haven't created any variants yet. Click the '+' button above to get started!"
                      end
                    else
                      filter.variants.each do |variant|
                        div data_controller: "modal", class: "flex items-center flex-wrap space-x-3 bg-gray-50 rounded shadow-sm px-2 py-2" do
                          if FilterPolicy.new(current_user, filter).delete?
                            link to: FilterVariants::Delete.with(variant.id), class: "text-red-600 hover:text-red-400 cursor-pointer", data_confirm: "Are you sure you want to remove this variant? This can't be undone." do
                              tag "svg", class: "h-5 w-5", fill: "currentColor", viewBox: "0 0 20 20", xmlns: "http://www.w3.org/2000/svg" do
                                tag "path", clip_rule: "evenodd", d: "M10 18a8 8 0 100-16 8 8 0 000 16zM7 9a1 1 0 000 2h6a1 1 0 100-2H7z", fill_rule: "evenodd"
                              end
                            end
                          end

                          if FilterPolicy.new(current_user, filter).update?
                            div class: "text-primary-600 hover:text-primary-400 cursor-pointer", data_action: "click->modal#show" do
                              tag "svg", class: "h-5 w-5", fill: "currentColor", viewBox: "0 0 20 20", xmlns: "http://www.w3.org/2000/svg" do
                                tag "path", d: "M17.414 2.586a2 2 0 00-2.828 0L7 10.172V13h2.828l7.586-7.586a2 2 0 000-2.828z"
                                tag "path", clip_rule: "evenodd", d: "M2 6a2 2 0 012-2h4a1 1 0 010 2H4v10h10v-4a1 1 0 112 0v4a2 2 0 01-2 2H4a2 2 0 01-2-2V6z", fill_rule: "evenodd"
                              end
                            end
                          end

                          replacements = variant.replacement_objects
                          filter.placeholders.each do |placeholder|
                            value = replacements.find { |replacement| replacement.placeholder == placeholder }.try(&.value)

                            if value
                              div do
                                span "#{placeholder}: ", class: "font-medium"
                                span value
                              end
                            else
                              div class: "font-bold text-red-600" do
                                span "#{placeholder}: ", class: "font-medium"
                                span "Not set"
                              end
                            end
                          end

                          render_filter_variant_edit_form_modal(variant)
                        end
                      end
                    end
                  end
                end

                render_filter_variant_new_form_modal
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
                        text "Skip inbox (send to archive)"
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

  private def render_filter_variant_new_form_modal
    div data_modal_target: "modal", class: "hidden fixed z-10 inset-0 overflow-y-auto" do
      div class: "flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0" do
        # Background overlay
        div data_action: "click->modal#hide", aria_hidden: "true", class: "fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity"

        # Trick the modal into being centered
        span aria_hidden: "true", class: "hidden sm:inline-block sm:align-middle sm:h-screen" do
          raw "&#8203;"
        end

        div aria_labelledby: "modal-headline", aria_modal: "true", class: "inline-block align-bottom bg-white rounded-lg px-4 pt-5 pb-4 text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full sm:p-6", role: "dialog" do
          div do
            div class: "mt-3 text-center sm:mt-5" do
              h3 "Create a new filter variant", class: "text-lg leading-6 font-medium text-gray-900", id: "modal-headline"

              div class: "mt-2" do
                para class: "text-sm text-gray-500" do
                  text "Fill in each of your placeholders with a value. We'll take care of the rest."
                end
              end
            end
          end

          form_for FilterVariants::Create.with(filter.id), class: "space-y-2 text-gray-900" do
            div class: "py-4 space-y-2" do
              mount FilterVariants::NewFormFields, filter: filter
            end

            div class: "mt-5 sm:mt-6 sm:grid sm:grid-cols-2 sm:gap-3 sm:grid-flow-row-dense" do
              button class: "w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-primary-600 text-base font-medium text-white hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 sm:col-start-2 sm:text-sm", type: "submit", data_disable_with: "Submitting..." do
                text "Submit"
              end
              button data_action: "click->modal#hide", class: "mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-base font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 sm:mt-0 sm:col-start-1 sm:text-sm", type: "button" do
                text "Cancel"
              end
            end
          end
        end
      end
    end
  end

  private def render_filter_variant_edit_form_modal(variant : FilterVariant)
    div data_modal_target: "modal", class: "hidden fixed z-10 inset-0 overflow-y-auto" do
      div class: "flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0" do
        # Background overlay
        div data_action: "click->modal#hide", aria_hidden: "true", class: "fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity"

        # Trick the modal into being centered
        span aria_hidden: "true", class: "hidden sm:inline-block sm:align-middle sm:h-screen" do
          raw "&#8203;"
        end

        div aria_labelledby: "modal-headline", aria_modal: "true", class: "inline-block align-bottom bg-white rounded-lg px-4 pt-5 pb-4 text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full sm:p-6", role: "dialog" do
          div do
            div class: "mt-3 text-center sm:mt-5" do
              h3 "Edit this filter variant", class: "text-lg leading-6 font-medium text-gray-900", id: "modal-headline"

              div class: "mt-2" do
                para class: "text-sm text-gray-500" do
                  text "Fill in each of your placeholders with a value. We'll take care of the rest."
                end
              end
            end
          end

          form_for FilterVariants::Update.with(variant.id), class: "space-y-2 text-gray-900" do
            div class: "py-4 space-y-2" do
              mount FilterVariants::EditFormFields, filter: filter, variant: variant
            end

            div class: "mt-5 sm:mt-6 sm:grid sm:grid-cols-2 sm:gap-3 sm:grid-flow-row-dense" do
              button class: "w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-primary-600 text-base font-medium text-white hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 sm:col-start-2 sm:text-sm", type: "submit", data_disable_with: "Submitting..." do
                text "Submit"
              end
              button data_action: "click->modal#hide", class: "mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-base font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 sm:mt-0 sm:col-start-1 sm:text-sm", type: "button" do
                text "Cancel"
              end
            end
          end
        end
      end
    end
  end
end
