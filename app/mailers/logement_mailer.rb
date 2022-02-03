class LogementMailer < ApplicationMailer
    #default from: 'notifications@example.com'
  
    def send_signup_email(user)
      # variable d'intentiation a user in view send_signup_email
      @user = user
      mail( :to => @user.email,
      :subject => 'Thanks for signing up for our airbibi app' )
    end

end