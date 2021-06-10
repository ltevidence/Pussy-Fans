class ContactMailer < ApplicationMailer
  default from: "pussyfans@yopmail.com"
  
  def general_message(contact)
    @contact = contact

    mail(to: "pussyfans@yopmail.com", subject: "Nouveau contact depuis le site")
  end
end

