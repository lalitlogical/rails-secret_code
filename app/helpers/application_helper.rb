module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then 'alert alert-info'
    when :success then 'alert alert-success'
    when :error then 'alert alert-danger'
    when :alert then 'alert alert-danger'
    when :warning then 'alert alert-warning'
    end
  end

  def no_of_count
    (options ||= []) << [1, 1]
    options << [10, 10]
    options << [20, 20]
    options << [50, 50]
    options << [100, 100]
    options
  end
end
