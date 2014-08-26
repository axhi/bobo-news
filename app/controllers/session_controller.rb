class SessionController < ActionController::Base

  def login
    @user = User.find_by(email: user_params[:email])
    if @user == nil
      redirect_to new_user_path
    elsif @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
