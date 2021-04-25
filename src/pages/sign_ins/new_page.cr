class SignIns::NewPage < AuthLayout
  def page_title
    "Sign in"
  end

  def content
    div class: "max-w-lg mx-auto my-20" do
      link OAuth::Google::Connect, class: "w-full inline-flex items-center justify-center py-4 px-8 space-x-2 border border-gray-400 sm:rounded-md shadow-sm bg-white font-medium text-gray-900 hover:bg-gray-50" do
        span "Sign in with "
        span "Google", class: "sr-only"
        render_google_logo
      end
    end
  end

  private def render_google_logo
    tag "svg", class: "w-8 h-8", viewBox: "0 0 48 48", xlink: "http://www.w3.org/1999/xlink", xmlns: "http://www.w3.org/2000/svg" do
      tag "defs" do
        tag "path", d: "M44.5 20H24v8.5h11.8C34.7 33.9 30.1 37 24 37c-7.2 0-13-5.8-13-13s5.8-13 13-13c3.1 0 5.9 1.1 8.1 2.9l6.4-6.4C34.6 4.1 29.6 2 24 2 11.8 2 2 11.8 2 24s9.8 22 22 22c11 0 21-8 21-22 0-1.3-.2-2.7-.5-4z", id: "a"
      end
      tag "clipPath", id: "b" do
        tag "use", href: "#a", overflow: "visible"
      end
      tag "path", clip_path: "url(#b)", d: "M0 37V11l17 13z", fill: "#FBBC05"
      tag "path", clip_path: "url(#b)", d: "M0 11l17 13 7-6.1L48 14V0H0z", fill: "#EA4335"
      tag "path", clip_path: "url(#b)", d: "M0 37l30-23 7.9 1L48 0v48H0z", fill: "#34A853"
      tag "path", clip_path: "url(#b)", d: "M48 48L17 24l-4-3 35-10z", fill: "#4285F4"
    end
  end
end
