class UserMailer < ApplicationMailer
	  default from: "example@mail.com"

  def contact_form(email, name, message)
    @message = message
    mail(from: email,
      to: 'louisportier@ymail.com',
      subject: "A new contact form message from #{name}")
  end

  def welcome(user)
    mail(from: "louisportier@ymail.com",
      to: email,
      subject: "Welcome to my website !")
  end
end
