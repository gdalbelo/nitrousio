module ApplicationHelper
  def time_to_read(text)
    time = text.split.size / 180.0
    distance_of_time_in_words(time.minutes)
  end

  def nav_status(controller)
    if params[:controller] == controller
      'active'
    end
  end
end
