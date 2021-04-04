class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: session_params[:email])
    
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:notice] = "ユーザーはログインしました"
      redirect_to root_url
    else
      render :new
    end
  end
  
  def destroy
    reset_session
    flash[:notice] = "ユーザーはログアウトしました"
    redirect_to root_url
  end
  
  private
  
  def session_params
    params.require(:session).permit(:email, :password)
  end
  
  
end
