class SessionsController < ApplicationController

  def new
  end

  def create
    # emails unique
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome #{user.name}!"
    else
      flash[:alert] = "Invalid login credentials."
      render :new
    end
  end

  def destroy
    # clear data from the session!
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
