class UserNotifier < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'
    @body[:url]  = "http://localhost:3000/account/activate/#{user.activation_code}"
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Welcome to MonkeyTasks!'
    @body[:url]  = "http://localhost:3000/"
  end
  
  protected
  def setup_email(user)
    @recipients  = "#{user.email}"
    @from        = "MonkeyTasks"
    @subject     = "[MonkeyTasks] "
    @sent_on     = Time.now
    @body[:user] = user
  end
end
