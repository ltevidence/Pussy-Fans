# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

ITEMS_NUM = 20
USERS_NUM = 10
ITEM_CARTS_NUM = 20

def reset_database(tables_name)
  tables_name.each do |table_name|
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table_name} RESTART IDENTITY CASCADE")
  end
end

def status_creation(object_created, object_name, idx_object)
  if object_created.valid?
    puts "#{object_name} n°#{idx_object} has been successffuly created."
  else
    puts "something wrong happend with the #{idx_object} #{object_name} created."
    print 'Errors: ' << object_created.errors.full_messages.join(' | ') << '\n'
  end
end

def create_items(nb_items)
  nb_items.times do |idx_item|

    title = Faker::Book.title
    description = Faker::Lorem.sentences(number: rand(3..8))
    price = Faker::Number.between(from: 15.0, to: 100.0).round(2)
    image_url = ["https://res.cloudinary.com/dcmcouvju/image/upload/v1623320480/1_jxyqjl.jpg", "https://res.cloudinary.com/dcmcouvju/image/upload/v1623320480/2_vdltby.jpg","https://res.cloudinary.com/dcmcouvju/image/upload/v1623320480/3_qej8tv.jpg","https://res.cloudinary.com/dcmcouvju/image/upload/v1623320480/4_anys0a.jpg", "https://res.cloudinary.com/dcmcouvju/image/upload/v1623320480/5_pcfaqe.jpg","https://res.cloudinary.com/dcmcouvju/image/upload/v1623320480/6_ljs9rz.jpg","https://res.cloudinary.com/dcmcouvju/image/upload/v1623320481/7_qevhnq.jpg","https://res.cloudinary.com/dcmcouvju/image/upload/v1623320481/8_xdqq9t.jpg","https://res.cloudinary.com/dcmcouvju/image/upload/v1623320481/9_qmnaf3.jpg","https://res.cloudinary.com/dcmcouvju/image/upload/v1623320481/10_cunayo.jpg","https://res.cloudinary.com/dcmcouvju/image/upload/v1623320481/11_woeg8z.jpg","https://res.cloudinary.com/dcmcouvju/image/upload/v1623320482/12_b21tlg.jpg","https://res.cloudinary.com/dcmcouvju/image/upload/v1623320482/13_leie46.jpg","https://res.cloudinary.com/dcmcouvju/image/upload/v1623320481/14_zojd6s.jpg","https://res.cloudinary.com/dcmcouvju/image/upload/v1623320481/15_mvc1o5.jpg","https://res.cloudinary.com/dcmcouvju/image/upload/v1623320481/16_lr16pd.jpg","https://res.cloudinary.com/dcmcouvju/image/upload/v1623320482/17_eicv2g.jpg","https://res.cloudinary.com/dcmcouvju/image/upload/v1623320482/18_qgemiz.jpg","https://res.cloudinary.com/dcmcouvju/image/upload/v1623320482/19_an2zxh.jpg","https://res.cloudinary.com/dcmcouvju/image/upload/v1623320482/20_qojrka.jpg","https://res.cloudinary.com/dcmcouvju/image/upload/v1623320482/21_c8exzj.jpg","https://res.cloudinary.com/dcmcouvju/image/upload/v1623320482/22_xplnk1.jpg"]

    item = Item.create(title: title, description: description.join(' '), price: price, image_url: image_url[rand(image_url.count)])
    puts "--------------- Item n°#{idx_item} ----------------\n\n"

    status_creation(item, 'item', idx_item)
  end
end

def create_users(nb_users)
  nb_users.times do |idx_user|
    email = Faker::Internet.free_email
    encrypted_password = Faker::Internet.password(min_length: 8, max_length: 20)
    user = User.create(email: email, password: encrypted_password)
    cart = user.build_cart
    cart.save
    puts "--------------- User n°#{idx_user} ----------------\n\n"
    status_creation(cart, 'cart', idx_user)
    status_creation(user, 'user', idx_user)
    puts "\n"
  end
end

def create_item_carts(nb_items_to_cart)
  nb_items_to_cart.times do |idx_item_cart|
    item = Item.all.sample
    cart = Cart.all.sample
    item_cart = ItemCart.create(item: item, cart: cart)

    puts "--------------- Item_cart n°#{idx_item_cart} ----------------\n\n"
    status_creation(item_cart, 'item_cart', idx_item_cart)
    puts "\n"
  end
end

def create_database
  create_items(ITEMS_NUM)
  create_users(USERS_NUM)
  create_item_carts(ITEM_CARTS_NUM)
end

def perform
  tables = ['items', 'users', 'carts', 'item_carts']
  reset_database(tables)
  create_database
end

perform
