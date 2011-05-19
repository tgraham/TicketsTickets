module TasksHelper
  def clean_time(time)
    return unless time
    time.strftime("%l:%M%p")
  end
end
