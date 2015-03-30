class MessagesController < ApplicationController

  def new
  	@message = Message.new
  end

  def create
  	@message = Message.new(message_params)
    # captcha_message = "驗證失敗，若不是機器人，在送出前，請務必打勾！"
  	if @message.valid?&&verify_recaptcha
      ContactMailer.ask_question(@message).deliver
  		redirect_to contact_url, notice: "問題已成功發送，請等候人員回覆！"
  	else
      flash.now[:warning] = "發生錯誤，可能的原因為：欄位不能空白，信箱格式錯誤，或者...若不是機器人，請務必打勾！"
  		render :new
  	end
  end

  private

	  def message_params
	  	params.require(:message).permit(:name, :email, :subject, :content)
	  end

end
