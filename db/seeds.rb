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
 #  status = %w[尚未付款 已付款 已出貨 取消訂單]
	# status.each { |s| OrderStatus.create!(name: s) }
	# Product.all.each { |p| p.update_attributes(active: true) }
	# TermsOfService.create!(shipping_fee: 80, terms: '網站使用條款', policy: '隱私權政策', disclaimer: '免責聲明')
	# Payment.create!(name: "信用卡")
	# Payment.create!(name: "網路ATM")
	# Payment.create!(name: "ATM 櫃員機")
	# 
	# Order.all.each { |o| o.update_attributes(payment_id: 1) }
	OrderStatus.create!(name: "取號成功")
