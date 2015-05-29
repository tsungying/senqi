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
    @about_office = CompanyProfile.where( brand_story: nil ).order("play_order desc")
    @about_brand_story = CompanyProfile.where( office_image: nil ).order("play_order desc").first
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
