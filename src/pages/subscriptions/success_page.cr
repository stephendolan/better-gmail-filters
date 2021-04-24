class Subscriptions::SuccessPage < MainLayout
  def page_title
    "You're a pro!"
  end

  def content
    section class: "bg-primary-700 rounded-lg shadow-lg", data_controller: "confetti" do
      div class: "max-w-2xl mx-auto text-center py-16 sm:py-28 md:py-44 px-4 sm:px-6 lg:px-8" do
        h2 class: "mt-4 text-3xl font-extrabold text-white sm:text-4xl" do
          span "Congrats, you've gone pro!", class: "block"
        end

        para "Start taking advantage of your subscription today.", class: "mt-4 text-lg leading-6 text-primary-100"

        div class: "w-full mx-auto mt-8 flex flex-col space-y-2 sm:flex-row sm:space-x-2 sm:space-y-0" do
          link "Create some filters", Home::Index, class: "flex-1 inline-flex items-center justify-center px-5 py-3 border border-transparent text-base font-medium rounded-md text-primary-700 bg-white hover:bg-primary-50 sm:w-auto"

          link "Manage your subscription", Me::Edit, class: "flex-1 inline-flex items-center justify-center px-5 py-3 border border-transparent text-base font-medium rounded-md text-primary-700 bg-white hover:bg-primary-50 sm:w-auto"
        end
      end
    end
  end
end
