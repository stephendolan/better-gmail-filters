# This class handles error responses and reporting.
#
# https://luckyframework.org/guides/http-and-routing/error-handling
class Errors::Show < Lucky::ErrorAction
  include Authentic::ActionHelpers(User)

  DEFAULT_MESSAGE = "Something went wrong."
  default_format :html
  dont_report [Lucky::RouteNotFoundError, Avram::RecordNotFoundError]

  def render(error : Lucky::RouteNotFoundError | Avram::RecordNotFoundError)
    if html?
      error_html "Sorry, we couldn't find that page.", status: 404
    else
      error_json "Not found", status: 404
    end
  end

  # Capture Pundit authorization exceptions to handle it elegantly
  def render(error : Pundit::NotAuthorizedError)
    if html?
      flash.failure = "Sorry, you're not allowed to do that."
      redirect_back fallback: Home::Index
    else
      error_json "Not authorized", status: 401
    end
  end

  # When the request is JSON and an InvalidOperationError is raised, show a
  # helpful error with the param that is invalid, and what was wrong with it.
  def render(error : Avram::InvalidOperationError)
    if html?
      error_html DEFAULT_MESSAGE, status: 500
    else
      error_json \
        message: error.renderable_message,
        details: error.renderable_details,
        param: error.invalid_attribute_name,
        status: 400
    end
  end

  # Always keep this below other 'render' methods or it may override your
  # custom 'render' methods.
  def render(error : Lucky::RenderableError)
    if html?
      error_html DEFAULT_MESSAGE, status: error.renderable_status
    else
      error_json error.renderable_message, status: error.renderable_status
    end
  end

  # If none of the 'render' methods return a response for the raised Exception,
  # Lucky will use this method.
  def default_render(error : Exception) : Lucky::Response
    if html?
      error_html DEFAULT_MESSAGE, status: 500
    else
      error_json DEFAULT_MESSAGE, status: 500
    end
  end

  private def error_html(message : String, status : Int)
    context.response.status_code = status
    html Errors::ShowPage, message: message, status: status
  end

  private def error_json(message : String, status : Int, details = nil, param = nil)
    json ErrorSerializer.new(message: message, details: details, param: param), status: status
  end

  # This method tells Authentic how to find the current user
  private def find_current_user(id) : User?
    UserQuery.new.id(id).first?
  end

  private def report(error : Exception) : Nil
    if (user = current_user)
      Raven.user_context(
        id: user.id.to_s,
        email: user.email,
        first_name: user.first_name,
        last_name: user.last_name
      )
    end
  end
end
