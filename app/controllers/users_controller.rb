class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(self.user_params)
    if @user.save
      flash[:message] = "Welcome '#{@user.handle}'!"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user == current_user || current_user.admin
      @user.destroy
      redirect_to root_path, alert: "Account deleted."
    else
      redirect_to root_path, alert: "Cannot delete accounts of other users."
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
