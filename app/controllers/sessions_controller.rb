class SessionsController < ApplicationController

  def new
  end

  def create
    # emails unique
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      flash[:message] = "Welcome '#{user.handle}'!"
      redirect_to root_path
    else
      flash[:message] = "Invalid login credentials."
      render :new
    end
  end

  def destroy
    # clear data from the session!
    session[:user_id] = nil

    flash[:message] = "Logged out!"
    redirect_to root_path
  end
end
