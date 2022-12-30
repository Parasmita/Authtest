class OtpMailer < ApplicationMailer
  def otp_email(user)
      @user = user
      mail(to: @user.email, subject: 'One time password')
  end
end
