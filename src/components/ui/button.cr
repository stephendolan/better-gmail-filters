class UI::Button < BaseComponent
  BUTTON_BACKGROUND_HOVER   = "hover:bg-primary-500"
  BUTTON_BACKGROUND_DEFAULT = "bg-primary-600"
  BUTTON_BACKGROUND_ACTIVE  = "active:bg-primary-700"
  BUTTON_BORDER_FOCUS       = "focus:border-primary-700"

  enum Size
    Small
    Medium
    Large
  end

  needs size : Size = Size::Medium

  def render
    span class: "inline-flex rounded-md shadow-sm" do
      tag_defaults class: "#{button_classes} #{size_classes}" do |button_builder|
        yield button_builder
      end
    end
  end

  private def button_classes
    [
      "inline-flex",
      "items-center",
      "border",
      "border-transparent",
      "leading-4",
      "font-medium",
      "rounded",
      "text-white",
      "#{BUTTON_BACKGROUND_DEFAULT}",
      "#{BUTTON_BACKGROUND_HOVER}",
      "focus:outline-none",
      "#{BUTTON_BORDER_FOCUS}",
      "focus:shadow-outline-primary",
      "#{BUTTON_BACKGROUND_ACTIVE}",
      "transition",
      "ease-in-out",
      "duration-150",
    ].join(" ")
  end

  private def size_classes
    classes = case size
              when Size::Small
                %w[
                  text-xs
                  px-2
                  py-1
                ]
              when Size::Medium
                %w[
                  text-sm
                  px-3
                  py-2
                ]
              when Size::Large
                %w[
                  text-base
                  px-4
                  py-2
                ]
              else
                %w[
                  text-sm
                  px-4
                  py-2
                ]
              end

    classes.join(" ")
  end
end
