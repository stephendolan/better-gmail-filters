class Shared::LayoutHead < BaseComponent
  needs page_title : String
  # This is used by the 'csrf_meta_tags' method
  needs context : HTTP::Server::Context

  def render
    head do
      if Lucky::Env.production?
        script src: "https://#{Fathom.settings.domain}/script.js", data_site: Fathom.settings.site_id, attrs: [:defer]
      end

      utf8_charset
      title "#{Application.settings.name} - #{@page_title}"
      meta name: "description", content: Application.settings.description
      css_link asset("css/app.css"), data_turbolinks_track: "reload"
      js_link asset("js/app.js"), defer: "true", data_turbolinks_track: "reload"
      meta name: "turbolinks-cache-control", content: "no-cache"
      csrf_meta_tags
      responsive_meta_tag
    end
  end
end
