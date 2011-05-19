module TasksHelper
  def clean_time(time)
    return unless time
    time.strftime("%l:%M%p")
  end
  
  def total_time(task)
    return unless task.start_time && task.finish_time
    distance_of_time_in_words(task.start_time, task.finish_time)
  end
end
