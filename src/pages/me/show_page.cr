class Me::ShowPage < MainLayout
  def page_title
    "Your Profile"
  end

  def content
    div class: "bg-white overflow-hidden shadow rounded-lg" do
      div class: "border-b border-gray-200 px-4 py-5 sm:px-6" do
        h1 "Your profile", class: "font-medium text-lg"
      end
      div class: "px-4 py-5 sm:p-6" do
        h3 "Team:  #{current_user.team.name}"
        h3 "First name:  #{current_user.first_name}"
        h3 "Last name:  #{current_user.last_name}"
        h3 "Email:  #{current_user.email}"
        h3 "Google ID:  #{current_user.google_id}"
        img alt: "Profile image", class: "h-8 w-8 rounded-full", src: current_user.image
      end
    end
  end
end
