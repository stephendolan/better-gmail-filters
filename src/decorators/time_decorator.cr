struct TimeDecorator < Decorator::Base
  decorates time : Time

  # Return a pretty version of a date and weekday in the format:
  # `Monday, November 2, 2020`
  def date_with_weekday : String
    time.to_s("%A, %B %-d, %Y")
  end

  # Return a pretty version of a date in the format:
  # `November 2, 2020`
  def date : String
    time.to_s("%B %-d, %Y")
  end

  # Return a pretty version of a datetime in the format:
  # `November 2, 2020 at 1:15 PM`
  def datetime : String
    time.to_s("%B %-d, %Y at %l:%M %P")
  end
end
