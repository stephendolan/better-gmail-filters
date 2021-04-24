class UI::Card < BaseComponent
  needs title : String
  needs actions : Proc(Void)?
  needs body : Proc(Void)
  needs pad_body : Bool = true

  def render
    div class: "bg-white overflow-hidden shadow rounded-none sm:rounded-lg" do
      div class: "px-4 py-5 border-b border-gray-200 sm:px-6" do
        div class: "-ml-4 -mt-2 flex items-center justify-between flex-wrap sm:flex-nowrap" do
          div class: "ml-4 mt-2" do
            h1 class: "text-lg leading-6 font-medium text-gray-900" do
              text title
            end
          end

          if (render_actions = actions)
            div class: "ml-4 mt-4 flex-shrink-0 flex space-x-3" do
              render_actions.call
            end
          end
        end
      end

      div class: body_classes do
        body.call
      end
    end
  end

  private def body_classes
    if pad_body?
      "px-4 py-5 sm:p-6"
    else
      ""
    end
  end
end
