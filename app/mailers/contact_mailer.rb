class ContactMailer < ActionMailer::Base
  # default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.ask_question.subject
  #
  def ask_question contact
    @contact = contact
    # mail to: "miracode.service@gmail.com", from: contact.email
    # mail to: "miracode.service@gmail.com", from: contact.email, subject: contact.subject
    mail to: "tsungying721@gmail.com", from: contact.email, subject: contact.subject

  end
end
