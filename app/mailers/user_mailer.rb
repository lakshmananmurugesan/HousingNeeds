class UserMailer < ActionMailer::Base
  default from: "laxmanan90@gmail.com"

  def communication(user)
    @user = user

    mail to: user.email,subject: "Confirmation"
  end

  def sendMail(mailID,article)
    @article = article
    mail to: mailID,subject: "New post added"
  end


end
