class SessionsController < ApplicationController
  def new
  end

  def login
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      OtpMailer.otp_email(@user).deliver_now
      redirect_to otp_validation_path(user_id: @user.id)
    else
      flash[:notice] = "Ivalid email or Password"
      redirect_to '/login'
    end
  end

  def otp_validation
    @user = User.find_by_id(params[:user_id])
  end

  def validate_with_otp
    @user = User.find_by_id(params[:user_id].to_i)
    if @user.authenticate_otp(params[:otp])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:notice] = "Ivalid otp"
      redirect_to '/login'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end
end
