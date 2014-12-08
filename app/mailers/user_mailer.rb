class UserMailer < ActionMailer::Base
  default from: "climb.ror.training@gmail.com"

  def welcome_email
    mail(to: 'vidya2255m@gmail.com', subject: 'Welcome to My Awesome Site')
  end

end
