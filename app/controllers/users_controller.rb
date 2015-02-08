class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to :back, :notice => "User updated."
    else
      redirect_to :back, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def restrict_care_recipient_accesss
    if current_user.care_recipient?
      redirect_to :back, :alert => "Access denied."
    end
  end

  def secure_params
    #FIXME probably not necessary because of devise settings (see registrations_controller)
    params.require(:user).permit(:role)
  end

end
