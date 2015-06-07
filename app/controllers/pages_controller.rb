class PagesController < ApplicationController

  before_action :authenticate_user!, only: [:notify]
  before_action :check_admin, only: [:notify]

  def index
    @prod_categories = current_language_product_categories
    @articles = current_language_articles.limit(3)
    @events = Event.order("publish_at desc").limit(3)
    @home_slider = HomePage.where( logo: nil ).order("play_order desc")
  end

  def about
    @company_infos = CompanyInfo.current_language_version
  end

  def contact

  end

  def notify
    @notification = Notification.all
    @atmPaymentInfo = AtmPaymentInfo.all
  end

  private

    def check_admin
      redirect_to root_url unless current_user.admin?
    end

end
