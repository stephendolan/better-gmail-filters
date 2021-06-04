class FilterExports::IndexPage < MainLayout
  quick_def page_title, "Import into Gmail"

  def content
    div class: "bg-white overflow-hidden" do
      div class: "relative max-w-7xl mx-auto py-16 px-4 sm:px-6 lg:px-8" do
        div class: "hidden lg:block absolute top-0 bottom-0 left-3/4 w-screen"
        div class: "mx-auto text-base max-w-prose lg:grid lg:grid-cols-2 lg:gap-8 lg:max-w-none" do
          div do
            h3 "Importing to Gmail", class: "mt-2 text-3xl leading-8 font-extrabold tracking-tight text-gray-900 sm:text-4xl"
          end
        end
        div class: "mt-8 lg:grid lg:grid-cols-2 lg:gap-8" do
          div class: "relative lg:row-start-1 lg:col-start-2" do
            tag "svg", aria_hidden: "true", class: "hidden lg:block absolute top-0 right-0 -mt-20 -mr-20", fill: "none", height: "384", viewBox: "0 0 404 384", width: "404" do
              tag "defs" do
                tag "pattern", height: "20", id: "de316486-4a29-4312-bdfc-fbce2132a2c1", patternUnits: "userSpaceOnUse", width: "20", x: "0", y: "0" do
                  tag "rect", class: "text-gray-200", fill: "currentColor", height: "4", width: "4", x: "0", y: "0"
                end
              end
              tag "rect", fill: "url(#de316486-4a29-4312-bdfc-fbce2132a2c1)", height: "384", width: "404"
            end
            div class: "hidden lg:block relative text-base mx-auto max-w-prose lg:max-w-none" do
              figure do
                div class: "aspect-w-12 aspect-h-7 lg:aspect-none" do
                  render_side_image
                end
              end
            end
          end
          div class: "mt-12 lg:mt-0" do
            div class: "max-w-prose mx-auto lg:max-w-none" do
              ol class: "overflow-hidden" do
                li class: "relative pb-10" do
                  div aria_hidden: "true", class: "-ml-px absolute mt-0.5 top-4 left-4 w-0.5 h-full bg-primary-600"
                  div class: "relative flex items-start group" do
                    span class: "h-9 flex items-center" do
                      span class: "relative z-10 w-8 h-8 flex items-center justify-center bg-primary-600 rounded-full group-hover:bg-primary-800" do
                        tag "svg", aria_hidden: "true", class: "w-5 h-5 text-white", fill: "currentColor", viewBox: "0 0 20 20", xmlns: "http://www.w3.org/2000/svg" do
                          tag "path", clip_rule: "evenodd", d: "M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z", fill_rule: "evenodd"
                        end
                      end
                    end
                    span class: "ml-4 min-w-0 flex flex-col" do
                      span "Create some filters", class: "text-xs font-semibold tracking-wide uppercase text-primary-600"
                      span "If you've created at least one filter, you're good to go.", class: "text-sm text-gray-500"
                    end
                  end
                end
                li class: "relative pb-10" do
                  div aria_hidden: "true", class: "-ml-px absolute mt-0.5 top-4 left-4 w-0.5 h-full bg-gray-300"
                  link to: Filters::Index, target: "_blank", class: "relative flex items-start group" do
                    span aria_hidden: "true", class: "h-9 flex items-center" do
                      span class: "relative z-10 w-8 h-8 flex items-center justify-center bg-white border-2 border-primary-600 rounded-full" do
                        span class: "h-2.5 w-2.5 bg-primary-600 rounded-full"
                      end
                    end
                    span class: "ml-4 min-w-0 flex flex-col" do
                      span "Export your filters", class: "text-xs font-semibold tracking-wide uppercase text-primary-600"
                      span "Click here, and watch the magic happen!", class: "text-sm text-gray-500"
                    end
                  end
                end
                li class: "relative pb-10" do
                  div aria_hidden: "true", class: "-ml-px absolute mt-0.5 top-4 left-4 w-0.5 h-full bg-gray-300"
                  a class: "relative flex items-start group", href: "https://mail.google.com/mail/#settings/filters", target: "_blank" do
                    span aria_hidden: "true", class: "h-9 flex items-center" do
                      span class: "relative z-10 w-8 h-8 flex items-center justify-center bg-white border-2 border-gray-300 rounded-full group-hover:border-gray-400" do
                        span class: "h-2.5 w-2.5 bg-transparent rounded-full group-hover:bg-gray-300"
                      end
                    end
                    span class: "ml-4 min-w-0 flex flex-col" do
                      span "Open your Gmail filter settings", class: "text-xs font-semibold tracking-wide uppercase text-primary-600"
                      span "We're going to import the file we just exported.", class: "text-sm text-gray-500 group-hover:text-gray-600"
                    end
                  end
                end
                li class: "relative pb-10" do
                  div aria_hidden: "true", class: "-ml-px absolute mt-0.5 top-4 left-4 w-0.5 h-full bg-gray-300"
                  a class: "relative flex items-start group", href: "#" do
                    span aria_hidden: "true", class: "h-9 flex items-center" do
                      span class: "relative z-10 w-8 h-8 flex items-center justify-center bg-white border-2 border-gray-300 rounded-full group-hover:border-gray-400" do
                        span class: "h-2.5 w-2.5 bg-transparent rounded-full group-hover:bg-gray-300"
                      end
                    end
                    span class: "ml-4 min-w-0 flex flex-col" do
                      span "Theme", class: "text-xs font-semibold tracking-wide uppercase text-gray-500"
                      span "Faucibus nec enim leo et.", class: "text-sm text-gray-500"
                    end
                  end
                end
                li class: "relative" do
                  a class: "relative flex items-start group", href: "#" do
                    span aria_hidden: "true", class: "h-9 flex items-center" do
                      span class: "relative z-10 w-8 h-8 flex items-center justify-center bg-white border-2 border-gray-300 rounded-full group-hover:border-gray-400" do
                        span class: "h-2.5 w-2.5 bg-transparent rounded-full group-hover:bg-gray-300"
                      end
                    end
                    span class: "ml-4 min-w-0 flex flex-col" do
                      span "Preview", class: "text-xs font-semibold tracking-wide uppercase text-gray-500"
                      span "Iusto et officia maiores porro ad non quas.", class: "text-sm text-gray-500"
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

  private def render_side_image
    tag "svg", data_name: "Layer 1", height: "613.91263", id: "f6c00235-76cc-41ae-84b2-bfc054d83f77", viewBox: "0 0 888 613.91263", xmlns: "http://www.w3.org/2000/svg" do
      title "active_options"
      tag "path", d: "M275.323,585.88462l-11.41944-18.452a273.13431,273.13431,0,0,1,12.6615-28.06228l7.49735,6.309-5.84681-9.44746c5.97881-11.20478,10.64756-18.24624,10.64756-18.24624s22.88762,37.7244,29.99091,77.32119l-15.59472,23.06949,17.01541-13.18641a110.50312,110.50312,0,0,1,.63974,13.87219c-.94012,46.70757-16.95677,84.2645-35.77423,83.88574s-33.30986-38.54976-32.36974-85.25733c.29145-14.4798,3.87216-29.56293,8.673-43.48536Z", fill: "#e6e6e6", transform: "translate(-156 -143.04369)"
      tag "path", d: "M223.65017,606.48327l-19.31345-9.893a273.13311,273.13311,0,0,1-3.66662-30.56732l9.67919,1.52538-9.88853-5.06522c-.67364-12.68225-.31672-21.12335-.31672-21.12335s39.09262,20.46315,65.641,50.68808l-1.42513,27.80946,7.74988-20.08346a110.50062,110.50062,0,0,1,7.7182,11.54454c23.33842,40.46973,29.04068,80.89917,12.73631,90.30171s-48.44116-15.78241-71.77958-56.25214c-7.23514-12.546-11.96638-27.30873-15.05315-41.70852Z", fill: "#e6e6e6", transform: "translate(-156 -143.04369)"
      tag "path", d: "M320.62561,755.851c-22.25416,1.42351-46.50238-.08279-72.29843,0V696.79035c22.73062,3.53858,46.97076,3.17518,72.29843,0Z", fill: "#e6e6e6", transform: "translate(-156 -143.04369)"
      tag "polygon", fill: "#e6e6e6", points: "689.193 342.668 453.019 380.696 452.018 151.095 688.192 0 689.193 342.668"
      tag "polygon", fill: "#fff", points: "667.176 308.643 463.026 352.675 463.026 160.534 667.176 49.73 667.176 308.643"
      tag "polygon", fill: "#3f3d56", points: "647.162 132.514 475.035 209.595 475.035 182.55 647.162 97.517 647.162 132.514"
      tag "polygon", fill: "#06b6d4", points: "647.162 204.567 475.035 265.277 475.035 238.592 647.162 170.035 647.162 204.567"
      tag "path", d: "M697.53648,314.17556a.645.645,0,0,1,1.24118-.04088l2.7869,8.78335,3.33872,10.52249a.645.645,0,0,1-.36673.7905l-6.4521,2.68854-5.67052,2.36286a.645.645,0,0,1-.87445-.74964l3.10159-12.59732Z", fill: "#e6e6e6", transform: "translate(-156 -143.04369)"
      tag "path", d: "M687.18454,379.667a1.06452,1.06452,0,0,1,2.04832-.06745l2.33611,7.36258,3.22251,10.15622a1.06454,1.06454,0,0,1-.60522,1.30458l-6.0974,2.54073-4.9031,2.04308a1.06452,1.06452,0,0,1-1.44311-1.23712l2.90283-11.79Z", fill: "#e6e6e6", transform: "translate(-156 -143.04369)"
      tag "polygon", fill: "#f2f2f2", points: "647.162 276.62 475.035 320.959 475.035 292.631 647.162 239.964 647.162 276.62"
      tag "path", d: "M799.15869,295.02551c0,6.027-2.70015,12.01954-6.00441,13.37389-3.27531,1.3425-5.90948-2.38638-5.90948-8.31806s2.63417-11.89626,5.90948-13.33362C796.45854,285.29766,799.15869,288.99854,799.15869,295.02551Z", fill: "#3f3d56", transform: "translate(-156 -143.04369)"
      tag "path", d: "M795.15575,296.72421c0,2.009-.89741,4.01407-2.00147,4.47724-1.10081.4618-1.99081-.78477-1.99081-2.78306s.89-4.00023,1.99081-4.47271C794.25834,293.4718,795.15575,294.71522,795.15575,296.72421Z", fill: "#fff", transform: "translate(-156 -143.04369)"
      tag "path", d: "M799.15869,365.077c0,6.027-2.70015,12.01954-6.00441,13.3739-3.27531,1.34249-5.90948-2.38639-5.90948-8.31807s2.63417-11.89626,5.90948-13.33361C796.45854,355.34912,799.15869,359.05,799.15869,365.077Z", fill: "#06b6d4", transform: "translate(-156 -143.04369)"
      tag "path", d: "M795.15575,366.77567c0,2.009-.89741,4.01407-2.00147,4.47723-1.10081.46181-1.99081-.78476-1.99081-2.78305s.89-4.00023,1.99081-4.47272C794.25834,363.52325,795.15575,364.76668,795.15575,366.77567Z", fill: "#fff", transform: "translate(-156 -143.04369)"
      tag "path", d: "M799.15869,435.12842c0,6.027-2.70015,12.01954-6.00441,13.3739-3.27531,1.34249-5.90948-2.38639-5.90948-8.31807s2.63417-11.89626,5.90948-13.33362C796.45854,425.40057,799.15869,429.10145,799.15869,435.12842Z", fill: "#f2f2f2", transform: "translate(-156 -143.04369)"
      tag "path", d: "M795.15575,436.82712c0,2.009-.89741,4.01408-2.00147,4.47724-1.10081.4618-1.99081-.78477-1.99081-2.78306s.89-4.00023,1.99081-4.47271C794.25834,433.57471,795.15575,434.81813,795.15575,436.82712Z", fill: "#fff", transform: "translate(-156 -143.04369)"
      tag "path", d: "M703.18454,437.71258a1.06452,1.06452,0,0,1,2.04832-.06746l2.33611,7.36259,3.22251,10.15622a1.06452,1.06452,0,0,1-.60522,1.30457l-6.0974,2.54074-4.9031,2.04308a1.06453,1.06453,0,0,1-1.44311-1.23713l2.90283-11.79Z", fill: "#e6e6e6", transform: "translate(-156 -143.04369)"
      tag "path", d: "M662.558,425.39934l9.31146-8.58908s21.077-14.51772,13.71488-22.499-22.20075,10.6303-22.20075,10.6303l-9.20827,6.03186Z", fill: "#a0616a", transform: "translate(-156 -143.04369)"
      tag "path", d: "M539.45024,429.39608l-5.424,7.46526s-7.57983,29.15,30.77846,30.698c0,0,48.98859,23.74873,61.11527,8.86981s45.5883-50.66863,45.5883-50.66863L651.82447,405.7558l-40.11266,41.92475-38.91452-19.50011S552.75233,417.126,539.45024,429.39608Z", fill: "#2f2e41", transform: "translate(-156 -143.04369)"
      tag "polygon", fill: "#e6e6e6", points: "357.923 424.679 307.135 611.796 313.533 613.076 366.88 424.679 357.923 424.679"
      tag "polygon", fill: "#e6e6e6", points: "419.494 424.679 470.281 611.796 463.883 613.076 410.536 424.679 419.494 424.679"
      tag "polygon", fill: "#e6e6e6", points: "384.795 420.84 393.312 612.109 400.708 612.438 391.194 418.28 384.795 420.84"
      tag "path", d: "M564.469,560.85732c0,4.85147-13.28064,10.05931-30.71161,11.73268-18.70837,1.796-34.91149-1.11922-34.91149-6.63414s16.20312-10.94793,34.91149-12.059C551.18834,552.86167,564.469,556.00585,564.469,560.85732Z", fill: "#e6e6e6", transform: "translate(-156 -143.04369)"
      tag "path", d: "M583.02391,528.05305l12.7965,8.95755s55.025,39.66917,49.90637,55.025-33.27091,76.779-33.27091,76.779l-35.83021-11.51686,40.94881-65.26217-21.75406-20.47441-11.51685-28.15231Z", fill: "#2f2e41", transform: "translate(-156 -143.04369)"
      tag "path", d: "M533.11754,505.01934s-25.593,39.66917-10.2372,51.186S581.74426,612.51,581.74426,612.51l8.95755,20.47441,31.99126,103.65168,39.66917-20.47441-35.83022-80.618s-3.83895-29.432-16.63545-46.06742-17.91511-40.94881-17.91511-40.94881l3.839-11.51686-22.91252-36.66148Z", fill: "#2f2e41", transform: "translate(-156 -143.04369)"
      tag "path", d: "M602.7082,661.48181l-23-7s-24.8366-1.023-23.557,7.93454,21.75406,67.82147,28.15231,63.98252,1.27965-21.75406,1.27965-21.75406Z", fill: "#2f2e41", transform: "translate(-156 -143.04369)"
      tag "polygon", fill: "#a0616a", points: "395.672 237.21 382.876 251.286 403.35 284.557 412.308 258.964 395.672 237.21"
      tag "path", d: "M563.82915,429.52l-22.72826-37.63781-7.98335,1.80759v12.79651l-2.5593,107.49063,42.22847-6.39825S575.346,438.47752,563.82915,429.52Z", fill: "#06b6d4", transform: "translate(-156 -143.04369)"
      tag "path", d: "M552.3123,428.24032l-19.19476-34.55057-16.63545,7.67791-29.432,120.28714L469.135,556.20536s58.86392,29.432,72.94007,0,15.35581-94.69413,15.35581-94.69413Z", fill: "#2f2e41", transform: "translate(-156 -143.04369)"
      tag "path", d: "M524.16,406.48626l-7.6779-5.1186s-29.432-6.39826-29.432,31.99126c0,0-21.75406,49.90636-6.39826,61.42322s52.46567,43.50811,52.46567,43.50811l19.19476-20.4744-43.50812-38.38952,17.91511-39.66916S536.95649,419.28276,524.16,406.48626Z", fill: "#2f2e41", transform: "translate(-156 -143.04369)"
      tag "path", d: "M533.11754,529.3327l8.95755,8.95755s15.35581,20.47441,23.03371,12.79651S553.592,529.3327,553.592,529.3327l-6.39825-8.95755Z", fill: "#a0616a", transform: "translate(-156 -143.04369)"
      tag "path", d: "M562.34557,417.90711l21.958,53.84132s8.95755,26.87266,8.95755,37.10986V537.0106l-24.31336-31.99126S555.74338,421.65007,562.34557,417.90711Z", fill: "#2f2e41", transform: "translate(-156 -143.04369)"
      tag "path", d: "M632.25769,726.43065s-6.3392,24.96005,1.98081,27.07312,78.129,3.9007,78.17309-7.897S667.105,724.06249,667.105,724.06249L650.35052,713.3124Z", fill: "#2f2e41", transform: "translate(-156 -143.04369)"
      tag "circle", cx: "411.6681", cy: "237.84956", fill: "#a0616a", r: "23.03371"
      tag "path", d: "M592.22968,376.75744s4.49919-19.49652,0-23.99572v2.99947s-2.99947-10.49813-8.9984-7.49866c0,0-7.49866-5.99892-8.99841-2.99947-8.82431-7.978-47.95252-.49854-28.95865,41.38862,0,0,3.46322-12.89371,3.46322-8.39451,0,0,8.9984-8.99839,10.49813-11.99786S586.23075,382.75637,592.22968,376.75744Z", fill: "#2f2e41", transform: "translate(-156 -143.04369)"
      tag "rect", fill: "#3f3d56", height: "2.24072", width: "888", y: "611.67191"
    end
  end
end
