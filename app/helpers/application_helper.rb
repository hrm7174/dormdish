module ApplicationHelper
  def current_profile
    # If you have a session-based profile system:
    @current_profile ||= UserProfile.find_by(id: session[:user_profile_id]) || UserProfile.first

    # OR if you have a devise/user-based system:
    # @current_profile ||= current_user&.user_profiles&.first
  end
end
