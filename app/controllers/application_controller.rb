class ApplicationController < ActionController::Base
  helper_method :current_profile

  private

  def current_profile
    @current_profile ||= UserProfile.find_by(id: session[:user_profile_id])
  end
end
