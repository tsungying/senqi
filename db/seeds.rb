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
# OrderStatus.create!(name: "取號成功")

homepage = HomePage.find(1)
homepage.settings(:company_info).intro = "每個女人與生俱來都有美麗的密碼，就藏在基因的數碼裡，青春的生命力給了你原初的完美！"
homepage.settings(:company_info).company_name = "朋鑫國際股份有限公司"
homepage.settings(:company_info).company_address = "100 台北市中正區博愛路63號10樓"
homepage.settings(:company_info).phone = "(02)2388-2158"
homepage.settings(:company_info).email = "miracode.service@gmail.com"
homepage.save!