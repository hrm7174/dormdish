class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: [ :show, :edit, :update, :destroy ]

  def new
    @user_profile = UserProfile.new
  end

  def create
    @user_profile = UserProfile.new(user_profile_params)
    if @user_profile.save
      session[:user_profile_id] = @user_profile.id
      redirect_to recipes_path
    else
      render :new
    end
  end

  def show
    # @user_profile is set by before_action
  end

  def edit
    # @user_profile is set by before_action
  end

  def update
    if @user_profile.update(user_profile_params)
      redirect_to @user_profile, notice: "Profile updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # NEW: Destroy action
  def destroy
    profile_name = @user_profile.name

    # Clear session if deleting current profile
    if session[:user_profile_id] == @user_profile.id
      session[:user_profile_id] = nil
    end

    # Delete profile (will cascade delete meal_plans, shopping_lists)
    @user_profile.destroy

    redirect_to root_path, notice: "Profile '#{profile_name}' and all associated data have been deleted."
  end

  private

  # NEW: Before action to set user profile
  def set_user_profile
    @user_profile = UserProfile.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Profile not found."
  end

  def user_profile_params
    params.require(:user_profile).permit(:name, :weekly_budget, appliances: [], dietary_preferences: [])
  end
end
