# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ITEM_NUM=15

def reset_database(tables_name)
  tables_name.each do |table_name|
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table_name} RESTART IDENTITY CASCADE")
  end
end

def status_creation(object_created, object_name, idx_object)
  if (object_created.valid?)
    puts "#{object_name} n°#{idx_object} has been successffuly created."
  else
    puts "something wrong happend with the #{idx_object} #{object_name} created."
    print "Errors: " + object_created.errors.full_messages.join(" | ") + "\n"
  end
end

def create_items(nb_items)
  nb_items.times do |idx_item|
    title = Faker::Book.title
    description = Faker::Lorem.sentences(number: rand(3..8))
    price = Faker::Number.between(from: 15.0, to: 100.0).round(2)
      image_url = "#{idx_item + 1}.jpg"

    item = Item.create(title: title, description: description.join(" "), price: price, image_url: image_url)


    status_creation(item, 'item', idx_item)
  end
end

def create_database
  create_items(ITEM_NUM)
end

def perform
  tables = ['items']
  reset_database(tables)
  create_database
end
perform
