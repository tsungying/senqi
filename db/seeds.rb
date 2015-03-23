# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   
	Admin.create(email: "tsungying721@gmail.com", password: "11111111", password_confirmation: "11111111")

  product_category_name = %w[絲快染 光摩棒 指膜 髮膜]
  product_category_name.each { |name| ProdCategory.create( name: name ) }
	