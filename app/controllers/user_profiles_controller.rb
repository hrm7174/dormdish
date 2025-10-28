class UserProfilesController < ApplicationController
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
    @user_profile = UserProfile.find(params[:id])
  end

  def edit
    @user_profile = UserProfile.find(params[:id])
  end

  def update
    @user_profile = UserProfile.find(params[:id])
    if @user_profile.update(user_profile_params)
      redirect_to @user_profile, notice: "Profile updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_profile_params
    params.require(:user_profile).permit(:name, :weekly_budget, appliances: [], dietary_preferences: [])
  end
end
