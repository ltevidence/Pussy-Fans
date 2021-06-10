class Contact < ActiveRecord::Base

  validates :email, 
    :presence => :true,
    :format => { 
      :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
      :message => "L'adresse email n'est pas conforme"
    }
  validates :message, :presence => :true
  validates :object, :presence => :true
  validates :name, :presence => :true
end