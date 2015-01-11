class ContactMailer < ActionMailer::Base
  default from: "salon@dodatkislubne.eu"

  def contact(email, body, topic = nil)
    @email = email
    @body = body
    @topic = topic
    address = "salon@dodatkislubne.eu"
    mail to: address, subject: "Wiadomość, że strony dodatkislubne.eu"
  end
end
