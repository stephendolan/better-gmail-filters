class SignIns::NewPage < AuthLayout
  def page_title
    "Sign in"
  end

  def content
    mount Shared::CenteredFormPanel, title: page_title do
    end
  end
end
