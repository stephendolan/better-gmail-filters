class Marketing::IndexPage < AuthLayout
  def content
    div class: "relative bg-gray-50 overflow-hidden" do
      render_hero
      render_features
    end
  end

  private def render_hero
    div class: "relative bg-white overflow-hidden border-b" do
      div class: "max-w-7xl mx-auto" do
        div class: "relative z-10 pb-8 bg-white sm:pb-16 md:pb-20 lg:max-w-2xl lg:w-full lg:pb-28 xl:pb-32" do
          tag "svg", aria_hidden: "true", class: "hidden lg:block absolute right-0 inset-y-0 h-full w-48 text-white transform translate-x-1/2", fill: "currentColor", preserveAspectRatio: "none", viewBox: "0 0 100 100" do
            tag "polygon", points: "50,0 100,0 50,100 0,100"
          end
          main class: "pt-10 mx-auto max-w-7xl px-4 sm:pt-12 sm:px-6 md:pt-16 lg:pt-20 lg:px-8 xl:pt-28" do
            div class: "text-center lg:text-left" do
              h1 class: "text-4xl tracking-tight font-extrabold text-gray-900 sm:text-5xl md:text-6xl" do
                span "Level up your", class: "block xl:inline"
                span " Gmail filters", class: "block text-primary-600 xl:inline"
              end
              para class: "mt-3 text-base text-gray-500 sm:mt-5 sm:text-lg sm:max-w-xl sm:mx-auto md:mt-5 md:text-xl lg:mx-0" do
                text "Gmail's interface for managing filters sucks, so we fixed it. Group your filters with categories, adjust filter actions intuitively, and generate complex dynamic filters with placeholders."
              end
              div class: "mt-8" do
                link OAuth::Google::Connect, class: "w-full sm:w-5/12 inline-flex items-center justify-center py-4 px-8 space-x-2 border border-gray-400 rounded-md shadow-sm bg-white font-medium text-gray-900 hover:bg-gray-50" do
                  span "Sign in with "
                  span "Google", class: "sr-only"
                  render_google_logo
                end
              end
            end
          end
        end
      end
      div class: "hidden lg:block lg:absolute lg:inset-y-0 lg:right-0 lg:w-1/2" do
        render_hero_image
      end
    end
  end

  private def render_features
    div class: "py-12 bg-white" do
      div class: "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8" do
        div class: "lg:text-center" do
          h2 "Features", class: "text-base text-primary-600 font-semibold tracking-wide uppercase"

          para class: "mt-2 text-3xl leading-8 font-extrabold tracking-tight text-gray-900 sm:text-4xl" do
            text "We feel your pain"
          end

          para class: "mt-4 max-w-2xl text-xl text-gray-500 lg:mx-auto" do
            text "Say goodbye to managing a critical part of your workflow in an interface that always felt like an afterthought."
          end
        end
        div class: "mt-10" do
          dl class: "space-y-10 md:space-y-0 md:grid md:grid-cols-2 md:gap-x-8 md:gap-y-10" do
            div class: "flex" do
              div class: "flex-shrink-0" do
                div class: "flex items-center justify-center h-12 w-12 rounded-md bg-primary-500 text-white" do
                  tag "svg", aria_hidden: "true", class: "h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
                    tag "path", d: "M13 10V3L4 14h7v7l9-11h-7z", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                  end
                end
              end
              div class: "ml-4" do
                dt class: "text-lg leading-6 font-medium text-gray-900" do
                  text "Dynamic filters"
                end
                dd class: "mt-2 text-base text-gray-500" do
                  text "No more spending hours copying and pasting filters. Use dynamic placeholders to generate up to 100,000 variants from a single filter."
                end
              end
            end
            div class: "flex" do
              div class: "flex-shrink-0" do
                div class: "flex items-center justify-center h-12 w-12 rounded-md bg-primary-500 text-white" do
                  tag "svg", class: "h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
                    tag "path", d: "M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                  end
                end
              end
              div class: "ml-4" do
                dt class: "text-lg leading-6 font-medium text-gray-900" do
                  text "Filter categories"
                end
                dd class: "mt-2 text-base text-gray-500" do
                  text "Place your filters in categories so that you can stay organized and make updates when your world changes."
                end
              end
            end
            div class: "flex" do
              div class: "flex-shrink-0" do
                div class: "flex items-center justify-center h-12 w-12 rounded-md bg-primary-500 text-white" do
                  tag "svg", class: "h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
                    tag "path", d: "M8 4H6a2 2 0 00-2 2v12a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-2m-4-1v8m0 0l3-3m-3 3L9 8m-5 5h2.586a1 1 0 01.707.293l2.414 2.414a1 1 0 00.707.293h3.172a1 1 0 00.707-.293l2.414-2.414a1 1 0 01.707-.293H20", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                  end
                end
              end
              div class: "ml-4" do
                dt class: "text-lg leading-6 font-medium text-gray-900" do
                  text "Import straight into Gmail"
                end
                dd class: "mt-2 text-base text-gray-500" do
                  text "Once you've got your filters created in #{Application.settings.name}, you're two clicks away from having them imported into Gmail."
                end
              end
            end
            div class: "flex" do
              div class: "flex-shrink-0" do
                div class: "flex items-center justify-center h-12 w-12 rounded-md bg-primary-500 text-white" do
                  tag "svg", class: "h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
                    tag "path", d: "M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                  end
                end
              end
              div class: "ml-4" do
                dt class: "text-lg leading-6 font-medium text-gray-900" do
                  text "Continuous updates"
                end
                dd class: "mt-2 text-base text-gray-500" do
                  text "Google probably has a lot going on, but our sole focus is on making managing your filters the best experience ever."
                end
              end
            end
          end
        end
      end
    end
  end

  private def render_right_rectangle_background
    tag "svg", class: "absolute left-full transform -translate-y-3/4 -translate-x-1/4 md:-translate-y-1/2 lg:-translate-x-1/2", fill: "none", height: "784", viewBox: "0 0 404 784", width: "404" do
      rectangle_background
    end
  end

  private def rectangle_background
    tag "defs" do
      tag "pattern", height: "20", id: "5d0dd344-b041-4d26-bec4-8d33ea57ec9b", patternUnits: "userSpaceOnUse", width: "20", x: "0", y: "0" do
        tag "rect", class: "text-gray-200", fill: "currentColor", height: "4", width: "4", x: "0", y: "0"
      end
    end
    tag "rect", fill: "url(#5d0dd344-b041-4d26-bec4-8d33ea57ec9b)", height: "784", width: "404"
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

  def render_hero_image
    div class: "bg-primary-600 py-4 h-full w-full" do
      tag "svg", class: "ml-auto xl:mx-auto mr-4 h-full w-2/3 object-cover", data_name: "Layer 1", height: "796.45997", id: "bd411abf-b37a-4216-8308-03ddb60011b7", viewBox: "0 0 895.28735 796.45997", width: "895.28735", xmlns: "http://www.w3.org/2000/svg" do
        tag "path", d: "M327.40646,845.05022c8.99256-7.59864,14.45479-19.60227,13.02232-31.28788s-10.30472-22.42829-21.81332-24.90978-24.62761,4.38767-28.12315,15.62986c-1.92376-21.67449-4.14055-44.25713-15.6641-62.715-10.43429-16.71314-28.50667-28.672-48.09305-30.81148s-40.20832,5.941-52.42362,21.40028-15.20618,37.93388-6.6509,55.68241c6.30238,13.07473,17.91358,22.80511,30.07923,30.72127,38.81262,25.2553,86.95964,33.78829,132.77224,27.04622Z", fill: "#f2f2f2", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M193.68016,717.34486A317.62453,317.62453,0,0,1,237.94428,761.299a322.163,322.163,0,0,1,34.90754,51.66276A320.84426,320.84426,0,0,1,287.8,844.613c.89773,2.19991-2.67454,3.15752-3.56229.98208a315.2755,315.2755,0,0,0-28.80782-54.50557,317.25954,317.25954,0,0,0-38.63584-47.729,316.49738,316.49738,0,0,0-25.72611-23.40344c-1.84429-1.5018.78315-4.10164,2.61223-2.61223Z", fill: "#fff", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M971.177,381.30811H848.16283a7.00787,7.00787,0,0,1-7-7V359.54883a7.00787,7.00787,0,0,1,7-7H971.177a7.00787,7.00787,0,0,1,7,7v14.75928A7.00787,7.00787,0,0,1,971.177,381.30811Z", fill: "#06b6d4", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M954.57762,358.74036l-52.42529-47.269a6.49357,6.49357,0,0,0-8.31738-.31952L779.10448,349.03333a6.50725,6.50725,0,0,0-4.13428,8.21l4.62744,14.01562a6.48792,6.48792,0,0,0,8.21045,4.13379l105.24365-34.74945,42.93653,38.71381a6.45422,6.45422,0,0,0,4.34472,1.67285q.17139,0,.34375-.00928a6.45674,6.45674,0,0,0,4.49219-2.13867l9.8833-10.96143A6.50778,6.50778,0,0,0,954.57762,358.74036Z", fill: "#06b6d4", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M374.0609,712.208a6.00672,6.00672,0,0,0-6,6V841.22217a6.00672,6.00672,0,0,0,6,6h14.75977a6.00672,6.00672,0,0,0,6-6V718.208a6.00672,6.00672,0,0,0-6-6Z", fill: "#06b6d4", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M420.0128,848.22217H405.25328a7.00787,7.00787,0,0,1-7-7V718.208a7.00787,7.00787,0,0,1,7-7H420.0128a7.00786,7.00786,0,0,1,7,7V841.22217A7.00786,7.00786,0,0,1,420.0128,848.22217Z", fill: "#06b6d4", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M444.178,727.74481s5.57626,50.14384-50.71915,48.44087S359.066,725.21115,359.066,725.21115s11.76453-9.24525,41.50286-.30367S444.178,727.74481,444.178,727.74481Z", fill: "#ccc", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M419.98619,642.40821a14.3767,14.3767,0,0,1-7.95764-26.36719l96.42774-63.81983a6.99927,6.99927,0,0,1,9.7008,1.97412l8.146,12.30762a7.00839,7.00839,0,0,1-1.974,9.70069l-96.42774,63.82031A14.30444,14.30444,0,0,1,419.98619,642.40821Z", fill: "#06b6d4", transform: "translate(-152.35632 -51.77002)"
        tag "circle", cx: "250.12146", cy: "480.55914", fill: "#06b6d4", r: "51"
        tag "path", d: "M402.51531,553.73809c3.30591-.0918,7.42029-.20654,10.59-2.522a8.13271,8.13271,0,0,0,3.20007-6.07276,5.47081,5.47081,0,0,0-1.86035-4.49315c-1.65552-1.39894-4.073-1.72706-6.67822-.96144l2.69922-19.72558-1.98145-.27149-3.17322,23.19,1.65467-.75928c1.91833-.87989,4.55163-1.32764,6.188.05517a3.51516,3.51516,0,0,1,1.15271,2.89551,6.14685,6.14685,0,0,1-2.38123,4.52783c-2.46667,1.80176-5.74622,2.03418-9.46582,2.13819Z", fill: "#2f2e41", transform: "translate(-152.35632 -51.77002)"
        tag "rect", fill: "#2f2e41", height: "2", width: "10.77161", x: "267.90887", y: "469.89434"
        tag "rect", fill: "#2f2e41", height: "2", width: "10.77161", x: "233.90887", y: "469.89434"
        tag "path", d: "M350.96145,738.30969s-4.40337-149.71476,57.24388-139.44022,35.9609,154.852,35.9609,154.852-13.21013,26.42025-45.50155-2.93559S350.96145,738.30969,350.96145,738.30969Z", fill: "#2f2e41", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M373.71187,489.25261c9.92325-6.73767,22.44776-2.16056,32.09,2.64779,9.3644,4.66978,19.91679,10.61158,30.51238,6.11348,4.138-1.75667,7.50133-5.19279,8.08592-9.79017.69638-5.47656-2.61539-10.60359-6.29858-14.32714a45.87734,45.87734,0,0,0-13.76536-9.072,64.33515,64.33515,0,0,0-15.66789-4.76416,68.19059,68.19059,0,0,0-59.581,18.73142,75.54784,75.54784,0,0,0-21.42529,58.07187c.84264,11.34532,4.466,22.91386,11.73539,31.82006,6.82041,8.35617,17.0332,14.23085,27.93323,14.72128a31.33438,31.33438,0,0,0,7.96241-.64673c1.883-.40151,2.6877,2.48979.79752,2.89284-11.35259,2.42073-23.11306-1.176-32.11706-8.25837-9.47849-7.45555-15.29417-18.74246-17.844-30.372-4.8795-22.25517,1.23331-46.2054,15.24162-64.02189a69.79594,69.79594,0,0,1,26.11761-20.60928,72.50758,72.50758,0,0,1,33.6916-6.1824,67.10446,67.10446,0,0,1,32.47908,10.29118c8.73053,5.64224,18.57033,17.603,11.45,28.18544-2.66262,3.95725-7.08293,6.36787-11.67193,7.35845a28.651,28.651,0,0,1-15.72391-1.36974c-11.40639-4.02781-21.95577-13.02788-34.72307-11.664a16.93132,16.93132,0,0,0-7.76458,2.8345c-1.60147,1.08735-3.10415-1.51085-1.51416-2.59041Z", fill: "#2f2e41", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M809.44118,256.9708a13.87983,13.87983,0,0,1,4.55006-25.23983l112.98817-24.59616a6.506,6.506,0,0,1,7.73352,4.96851l-.48844.10648.48844-.10648,3.13952,14.42194a6.49965,6.49965,0,0,1-4.96873,7.73378L819.89555,258.85521a14.097,14.097,0,0,1-1.48288.24128A13.77477,13.77477,0,0,1,809.44118,256.9708Z", fill: "#06b6d4", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M800.19042,248.81836h0q-.10145-.40209-.17969-.813c-.929-4.89355.76807-10.04541,4.77832-14.50781a30.70542,30.70542,0,0,1,16.27417-9.06543l51.51123-11.27a6.50068,6.50068,0,0,1,7.77539,5.13721l4.49414,23.67383a6.466,6.466,0,0,1-4.99658,7.562l-51.83716,11.34033a33.32235,33.32235,0,0,1-7.11645.7832C810.68187,261.65869,802.17919,256.68457,800.19042,248.81836Z", fill: "#2f2e41", transform: "translate(-152.35632 -51.77002)"
        tag "circle", cx: "656.84893", cy: "93.07642", fill: "#06b6d4", r: "51"
        tag "path", d: "M852.24278,163.25537c3.30591-.09179,7.42029-.20654,10.59-2.522a8.13268,8.13268,0,0,0,3.20007-6.07275,5.47078,5.47078,0,0,0-1.86035-4.49315c-1.65552-1.39894-4.073-1.72707-6.67822-.96144l2.69922-19.72559L858.212,129.209l-3.17321,23.18994,1.65466-.75928c1.91833-.87988,4.55163-1.32764,6.188.05518a3.51513,3.51513,0,0,1,1.15271,2.8955,6.14689,6.14689,0,0,1-2.38123,4.52784c-2.46667,1.80175-5.74621,2.03418-9.46582,2.13818Z", fill: "#2f2e41", transform: "translate(-152.35632 -51.77002)"
        tag "rect", fill: "#2f2e41", height: "2", width: "10.77161", x: "683.63634", y: "79.41163"
        tag "path", d: "M805.63715,93.69558A42.16088,42.16088,0,0,0,789.15035,62.81a41.06466,41.06466,0,0,0-35.01478-6.678,40.44115,40.44115,0,0,0-26.88252,22.93858A42.10734,42.10734,0,0,0,723.64292,96.763a47.83335,47.83335,0,0,0,4.83068,19.06711c3.00716,6.55215,6.8,12.69925,10.094,19.10425a152.46211,152.46211,0,0,1,8.37722,19.557,154.17909,154.17909,0,0,1,8.32173,42.37385c1.22412,22.7707-.95445,56.01429-26.66,64.75306-6.5368,2.22223-13.58849,2.63594-20.442,2.61783a83.9514,83.9514,0,0,1-21.42037-2.509c-12.13546-3.24044-23.65553-10.84961-28.8264-22.67173a31.5534,31.5534,0,0,1-2.373-8.56911c-.10763-.80991.7666-1.49235,1.5-1.5a1.53685,1.53685,0,0,1,1.5,1.5c1.67411,12.59789,12.17164,22.25884,23.56929,26.60212a67.69743,67.69743,0,0,0,20.7358,4.01122c7.04626.356,14.36228.30089,21.26181-1.32054a30.79233,30.79233,0,0,0,16.01386-9.1029,41.40174,41.40174,0,0,0,8.35941-15.12234c4.05745-12.3851,4.48264-26.00217,3.76968-38.91066a151.26241,151.26241,0,0,0-8.49774-42.1934,147.93442,147.93442,0,0,0-8.80388-19.95791c-3.34244-6.28626-7.05366-12.39483-9.86986-18.94722a49.44357,49.44357,0,0,1-4.44457-19.15342,45.24381,45.24381,0,0,1,3.5757-17.79308,43.37042,43.37042,0,0,1,25.81023-24.36088,44.64075,44.64075,0,0,1,36.01579,2.95013,45.385,45.385,0,0,1,21.25517,27.7329,43.4241,43.4241,0,0,1,1.34171,8.7753c.09888,1.92956-2.90139,1.92423-3,0Z", fill: "#2f2e41", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M795.66388,94.74877A23.48756,23.48756,0,0,0,787.807,80.41594a23.16913,23.16913,0,0,0-16.195-5.37552c-1.92969.09652-1.92456-2.90374,0-3a26.10351,26.10351,0,0,1,26.94474,21.91084c.28826,1.88868-2.602,2.70292-2.89284.79751Z", fill: "#2f2e41", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M789.36058,94.92237a5.50012,5.50012,0,0,1,3.49854-6.94678l14.24365-4.70313a5.49973,5.49973,0,1,1,3.44873,10.44483l-14.24365,4.70312a5.49833,5.49833,0,0,1-6.94727-3.498Z", fill: "#2f2e41", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M900.59128,164.2202a5.00563,5.00563,0,0,0-2.16442,8.74782l22.01148,18.2886a3.254,3.254,0,0,1,.78254.978,3.058,3.058,0,0,1,.29984,1.20658l1.37407,33.54052a4.893,4.893,0,0,0,3.84944,4.67025l.039.00886a4.88619,4.88619,0,0,0,5.486-2.4747l7.93961-14.47938a3.01067,3.01067,0,0,1,2.68886-1.54207,2.91032,2.91032,0,0,1,2.13318.94676l38.101,40.65511a4.9682,4.9682,0,0,0,4.37012,1.5275,5.01831,5.01831,0,0,0,3.74359-2.70707L1047.112,141.81528a5.00224,5.00224,0,0,0-5.50324-7.13867l-1.80913.37812-139.2084,29.16546Zm-.89209,7.21174a3.0067,3.0067,0,0,1,1.30772-5.25075l139.16494-29.15495,1.8521-.38872a3.00779,3.00779,0,0,1,3.30289,4.27939L989.46053,252.6886a3.00049,3.00049,0,0,1-4.86861.70764l-38.10059-40.65488a4.795,4.795,0,0,0-1.29958-1.00322l96.81218-70.23378a2.00253,2.00253,0,0,0-1.648-3.57463,1.74433,1.74433,0,0,0-.32272.11109l-117.54867,52.471a4.93356,4.93356,0,0,0-.77394-.79126L899.69919,171.432Z", fill: "#ccc", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M900.59128,164.2202a5.00563,5.00563,0,0,0-2.16442,8.74782l22.01148,18.2886a3.254,3.254,0,0,1,.78254.978,3.058,3.058,0,0,1,.29984,1.20658l1.37407,33.54052a4.893,4.893,0,0,0,3.84944,4.67025l.039.00886a4.88619,4.88619,0,0,0,5.486-2.4747l7.93961-14.47938a3.01067,3.01067,0,0,1,2.68886-1.54207,2.91032,2.91032,0,0,1,2.13318.94676l38.101,40.65511a4.9682,4.9682,0,0,0,4.37012,1.5275,5.01831,5.01831,0,0,0,3.74359-2.70707L1047.112,141.81528a5.00224,5.00224,0,0,0-5.50324-7.13867l-1.80913.37812-139.2084,29.16546Zm-.89209,7.21174a3.0067,3.0067,0,0,1,1.30772-5.25075l139.16494-29.15495,1.8521-.38872a3.00779,3.00779,0,0,1,3.30289,4.27939L989.4605,252.68857a3.00049,3.00049,0,0,1-4.86861.70764L946.4913,212.74133a4.795,4.795,0,0,0-1.29958-1.00322,4.866,4.866,0,0,0-2.2687-.57772c-.11155-.00485-.22538,0-.3396.00473l-.00954-.00217a4.98946,4.98946,0,0,0-4.11514,2.58151l-7.94183,14.4891a2.91089,2.91089,0,0,1-3.29953,1.47485l-.01953-.00445a2.90449,2.90449,0,0,1-2.30613-2.80134l-1.37361-33.54042a4.73077,4.73077,0,0,0-.15127-1.04972l.00223-.00975a4.79573,4.79573,0,0,0-.35708-.95291,4.64792,4.64792,0,0,0-.52744-.838,4.93356,4.93356,0,0,0-.77394-.79126L899.69919,171.432Z", fill: "#3f3d56", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M922.48452,190.5118l117.54864-52.471a1.7451,1.7451,0,0,1,.32272-.1111,2.00253,2.00253,0,0,1,1.648,3.57464l-96.81218,70.23375-1.70818,1.24189-1.16981-1.6198.26018-.19719.00954.00217,98.24113-71.28275L923.369,192.30273l-.00223.00975-.5117.22209-.81534-1.82646Z", fill: "#3f3d56", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M775.6201,349.73a5.50623,5.50623,0,0,0-5.5,5.5v20a5.50622,5.50622,0,0,0,5.5,5.5h64a5.50622,5.50622,0,0,0,5.5-5.5v-20a5.50622,5.50622,0,0,0-5.5-5.5Z", fill: "#2f2e41", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M768.07437,248.27973a51.26537,51.26537,0,0,0-1.64736,27.53993c5.08637,24.93454,3.19286,54.41161-1.80691,85.91032,0,3.31372,2.30813,6,5.15534,6h78.18932c2.84722,0,5.15534-2.68629,5.15534-6v-93.5c0-27.63-18.7825-50.24-42.274-51.44-.65281-.04-1.31443-.06-1.976-.06C790.543,216.73,774.78458,229.76024,768.07437,248.27973Z", fill: "#2f2e41", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M792.97631,369.63086V253.99658a13.87988,13.87988,0,0,1,27.75976,0V369.63086a6.50736,6.50736,0,0,1-6.5,6.5H799.47631A6.50736,6.50736,0,0,1,792.97631,369.63086Z", fill: "#06b6d4", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M816.71874,286.80762l-20.98-.92334a6.50759,6.50759,0,0,1-6.20777-6.77979l1.47364-33.46777a17,17,0,1,1,33.967,1.49561l-1.47339,33.46777A6.50018,6.50018,0,0,1,817.012,286.814Q816.86584,286.814,816.71874,286.80762Z", fill: "#2f2e41", transform: "translate(-152.35632 -51.77002)"
        tag "ellipse", cx: "700.76378", cy: "241.95997", fill: "#2f2e41", rx: "4.5", ry: "14.5"
        tag "circle", cx: "454.14958", cy: "397.45997", fill: "#ccc", r: "25"
        tag "path", d: "M853.73431,474.23h-192a8,8,0,1,1,0-16h192a8,8,0,0,1,0,16Z", fill: "#ccc", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M801.73431,440.23h-140a8,8,0,1,1,0-16h140a8,8,0,0,1,0,16Z", fill: "#ccc", transform: "translate(-152.35632 -51.77002)"
        tag "circle", cx: "454.14958", cy: "492.45997", fill: "#ccc", r: "25"
        tag "path", d: "M853.73431,569.23h-192a8,8,0,1,1,0-16h192a8,8,0,0,1,0,16Z", fill: "#ccc", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M801.73431,535.23h-140a8,8,0,1,1,0-16h140a8,8,0,0,1,0,16Z", fill: "#ccc", transform: "translate(-152.35632 -51.77002)"
        tag "circle", cx: "454.14958", cy: "588.45997", fill: "#ccc", r: "25"
        tag "path", d: "M853.73431,665.23h-192a8,8,0,1,1,0-16h192a8,8,0,0,1,0,16Z", fill: "#ccc", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M801.73431,631.23h-140a8,8,0,1,1,0-16h140a8,8,0,0,1,0,16Z", fill: "#ccc", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M920.6201,710.23h-398a17.01916,17.01916,0,0,1-17-17v-297a17.01917,17.01917,0,0,1,17-17h398a17.01917,17.01917,0,0,1,17,17v297A17.01916,17.01916,0,0,1,920.6201,710.23Zm-398-329a15.017,15.017,0,0,0-15,15v297a15.017,15.017,0,0,0,15,15h398a15.017,15.017,0,0,0,15-15v-297a15.017,15.017,0,0,0-15-15Z", fill: "#3f3d56", transform: "translate(-152.35632 -51.77002)"
        tag "circle", cx: "360.26378", cy: "332.45997", fill: "#06b6d4", r: "56"
        tag "path", d: "M507.06922,405.59268a5.80785,5.80785,0,0,1-3.49458-1.1608l-.06249-.04693L490.35176,394.3089a5.84686,5.84686,0,1,1,7.11213-9.28228l8.52429,6.53631,20.14427-26.27106a5.84664,5.84664,0,0,1,8.19754-1.08212l-.12525.17006.1285-.16758a5.85343,5.85343,0,0,1,1.08211,8.19759l-23.69447,30.90106A5.84922,5.84922,0,0,1,507.06922,405.59268Z", fill: "#fff", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M512.19029,719.06738a6.92682,6.92682,0,0,1-2.85522-.61328H509.335L403.83068,671.124a14.37931,14.37931,0,1,1,11.77111-26.23926l105.50464,47.32959a6.99932,6.99932,0,0,1,3.52173,9.25146l-6.041,13.4668A7.018,7.018,0,0,1,512.19029,719.06738Z", fill: "#06b6d4", transform: "translate(-152.35632 -51.77002)"
        tag "path", d: "M534.35632,848.23h-381a1,1,0,1,1,0-2h381a1,1,0,0,1,0,2Z", fill: "#3f3d56", transform: "translate(-152.35632 -51.77002)"
      end
    end
  end
end
