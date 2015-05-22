class OrderMailer < ActionMailer::Base
  include Roadie::Rails::Automatic
	default from: "miracode.service@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.pending.subject
  #
  def pending(order)
    @order = order
    mail to: order.user.email, subject: "Miracode 訂單通知：#{order.user.name} 您好，訂單建立成功！"
  end

  def paid(order)
    @order = order
    mail to: order.user.email, subject: "Miracode 訂單通知：#{order.user.name} 您好，訂單付款完成，我們會儘快為您處理！"
  end

  def ready_to_ship(order)
    @order = order
    mail to: "miracode.service@gmail.com", subject: "Miracode 付款完成通知：訂單編號 #{order.merchant_trade_no}，金額 #{order.total} "
  end
end
