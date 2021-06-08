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
ORDERS_NUM = 5

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
    image_url = "#{idx_item + 1}.jpg"

    item = Item.create(title: title, description: description.join(' '), price: price, image_url: image_url)
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

def create_orders(nb_orders)
  item = Item.all.sample
  nb_orders.times do |idx_order|
    cart = Cart.all.sample
    order = Order.create(item: item, cart: cart)

    puts "--------------- Order n°#{idx_order} ----------------\n\n"
    status_creation(order, 'order', idx_order)
    puts "\n"
  end
end

def create_database
  create_items(ITEMS_NUM)
  create_users(USERS_NUM)
  create_orders(ORDERS_NUM)
end

def perform
  tables = ['items', 'users', 'carts', 'orders']
  reset_database(tables)
  create_database
end

perform
