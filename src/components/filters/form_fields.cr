class Filters::FormFields < BaseComponent
  needs operation : SaveFilter
  needs current_user : User

  def render
    div class: "space-y-8 sm:space-y-5" do
      div do
        h3 class: "text-lg leading-6 font-medium text-gray-900" do
          text "Essentials"
        end
        para class: "mt-1 max-w-2xl text-sm text-gray-500" do
          text "Choose a name and category for your filter, and supply the Gmail search query."
        end
      end

      hr

      div class: "mt-6 sm:mt-5 space-y-6 sm:space-y-5" do
        mount Shared::Field, operation.name, &.text_input(autofocus: "true")

        mount Shared::Field, operation.category_id do |input_html|
          input_html.select_input do
            select_prompt("Select category") if operation.category_id.nil?
            options_for_select(operation.category_id, category_options)
          end
        end

        div do
          mount Shared::Field, operation.search_query, "Gmail search query", &.textarea
          if operation.search_query.valid?
            small "Enter up to 5 unique placeholders like 'from:receipts@{{invoice_company}}', and you can give them values later!", class: "ml-2 text-primary-700 font-medium"
          end
        end

        div class: "flex items-start" do
          div class: "h-5 flex items-center" do
            checkbox(operation.is_public, class: "focus:ring-primary-500 h-4 w-4 text-primary-600 border-gray-300 rounded")
          end
          div class: "ml-3 text-sm" do
            mount Shared::FieldLabel, operation.is_public, "Make this filter public for sharing"
          end
        end
      end

      div do
        h3 class: "text-lg leading-6 font-medium text-gray-900" do
          text "Actions"
        end
        para class: "mt-1 max-w-2xl text-sm text-gray-500" do
          text "Determine what to do with messages matching your search query."
        end
      end

      hr

      div class: "mt-6 sm:mt-5 space-y-6 sm:space-y-5" do
        div class: "grid grid-cols-4 gap-4" do
          div class: "col-span-3" do
            mount Shared::Field, operation.should_apply_label, "Apply label", &.text_input
          end

          div class: "col-span-1" do
            mount Shared::Field, operation.readonly_account_labels, "Current Gmail labels" do |input_html|
              input_html.select_input append_class: "flex-1" do
                options_for_select(operation.readonly_account_labels, label_options)
              end
            end
          end
        end
        if operation.should_apply_label.valid?
          small "Enter up to 5 unique placeholders like 'Accounts/{{customer}}', and you can give them values later!", class: "ml-2 text-primary-700 font-medium"
        end

        div class: "flex items-start" do
          div class: "h-5 flex items-center" do
            checkbox(operation.should_mark_as_read, class: "focus:ring-primary-500 h-4 w-4 text-primary-600 border-gray-300 rounded")
          end
          div class: "ml-3 text-sm" do
            mount Shared::FieldLabel, operation.should_mark_as_read, "Mark as read"
          end
        end

        div class: "flex items-start" do
          div class: "h-5 flex items-center" do
            checkbox(operation.should_archive, class: "focus:ring-primary-500 h-4 w-4 text-primary-600 border-gray-300 rounded")
          end
          div class: "ml-3 text-sm" do
            mount Shared::FieldLabel, operation.should_archive, "Skip inbox (send to archive)"
          end
        end

        div class: "flex items-start" do
          div class: "h-5 flex items-center" do
            checkbox(operation.should_star, class: "focus:ring-primary-500 h-4 w-4 text-primary-600 border-gray-300 rounded")
          end
          div class: "ml-3 text-sm" do
            mount Shared::FieldLabel, operation.should_star, "Mark as starred"
          end
        end

        div class: "flex items-start" do
          div class: "h-5 flex items-center" do
            checkbox(operation.should_never_mark_spam, class: "focus:ring-primary-500 h-4 w-4 text-primary-600 border-gray-300 rounded")
          end
          div class: "ml-3 text-sm" do
            mount Shared::FieldLabel, operation.should_never_mark_spam, "Never mark as spam"
          end
        end

        div class: "flex items-start" do
          div class: "h-5 flex items-center" do
            checkbox(operation.should_mark_important, class: "focus:ring-primary-500 h-4 w-4 text-primary-600 border-gray-300 rounded")
          end
          div class: "ml-3 text-sm" do
            mount Shared::FieldLabel, operation.should_mark_important, "Mark as important"
          end
        end

        mount Shared::Field, operation.should_forward_to, "Forward to", &.text_input
        if operation.should_forward_to.valid?
          small "Enter up to 5 unique placeholders like 'invoicing@{{customer_domain}}', and you can give them values later!", class: "ml-2 text-primary-700 font-medium"
        end
      end
    end
  end

  private def category_options
    CategoryQuery.new.owner_id(current_user.id).map do |category|
      {category.label, category.id}
    end
  end

  private def label_options
    label_list = Google::LabelList.for(current_user)

    label_list.map do |label|
      {label.name, label.name}
    end
  end
end
