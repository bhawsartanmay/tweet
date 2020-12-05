module ApplicationHelper
  def follow_unfollow
    "<%= link_to 'follow', users_path %>".html_safe
  end
end
