class UsersController < ApplicationController
  before_action :authenticate, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome #{@user.name}!"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if params[:id].to_i != current_user.id && !current_user.admin?
      redirect_to root_path, alert: 'Cannot update other users.'
    elsif @user.update_attributes(user_params)
      redirect_to user_path, notice: 'User updated!'
    else
      render 'edit', alert: "Could not update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    if user == current_user || current_user.admin?
      if user.destroy
        session[:user_id] = nil
        redirect_to root_path, alert: "Account deleted."
      else
        redirect_to root_path, alert: "There was a problem!"
      end
    else
      redirect_to root_path, alert: "Cannot delete accounts of other users."
    end
  end

  private

    def user_params
      params.require(:user).permit(
        :email,
        :name,
        :password,
        :password_confirmation
      )
    end
end
