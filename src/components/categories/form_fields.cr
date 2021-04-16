class Categories::FormFields < BaseComponent
  needs operation : SaveCategory

  def render
    mount Shared::Field, operation.label, &.text_input(autofocus: "true")
  end
end
