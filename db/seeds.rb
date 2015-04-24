# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   
  # product_category_name = %w[絲快染 光摩棒 指膜 髮膜]
  # product_category_name.each { |name| ProdCategory.create( name: name ) }
  status = %w[在購物車階段 已下單 已出貨 取消訂單]
	status.each { |s| OrderStatus.create!(name: s) }

	Product.all.each { |p| p.update_attributes(active: true) }