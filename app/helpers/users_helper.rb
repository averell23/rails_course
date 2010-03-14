module UsersHelper
  
  def link_to_profile_or_self
    user_is_self? ? link_to('Edit Profile', edit_user_path(@user)) : link_to('My profile', user_path(current_user))
  end
  
  def user_is_self?
    @user == current_user
  end
  
  def profile_head
    if(user_is_self?)
      "Welcome to your profile #{@user.name}"
    else
      "Your friend #{@user.name}"
    end
  end
  
end
