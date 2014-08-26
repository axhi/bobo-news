module PostsHelper
  def show_date(post_date)
    if DateTime.now.utc.month - post_date.month > 1
     "#{pluralize(DateTime.now.utc.month - post_date.month, 'month')} ago"
    elsif DateTime.now.utc.day - post_date.day >= 1
     "#{pluralize(DateTime.now.utc.day - post_date.day, 'day')} ago"
    elsif DateTime.now.utc.hour - post_date.hour > 1
     "#{pluralize(DateTime.now.utc.hour - post_date.hour, 'hour')} ago"
    else
     "#{pluralize(DateTime.now.utc.min - post_date.min, 'minute')} ago"
    end
  end
end
