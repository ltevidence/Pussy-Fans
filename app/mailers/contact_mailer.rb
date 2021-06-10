class ContactMailer < ApplicationMailer
  default from: "pussyfans@yopmail.com"
  
  def general_message(contact)
    @contact = contact

    mail(to: "pussyfans@yopmail.com", subject: "Nouvelle demande de contact depuis PussyFans")
  end
end

