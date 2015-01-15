# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@p1 = Product.create(title: '普通', price: 1000)
@p2 = Product.create(title: '中級', price: 2000)
@p3 = Product.create(title: '高級', price: 3000)

User.create(email: 'eddie@visionbundles.com', 
  password: '88888888', 
  password_confirmation: '88888888', 
  gender: :male, product: @p2)
