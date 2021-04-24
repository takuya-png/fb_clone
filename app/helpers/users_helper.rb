module UsersHelper
  def choose_url
    if action_name == 'new'
      users_path
    elsif action_name == 'edit'
      user_path
    end
  end
  def choose_method
    if action_name == 'new'
      'post'
    elsif action_name == 'edit'
      'patch'
    end
  end
end
