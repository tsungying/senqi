class PagesController < ApplicationController

  def index
    @prod_categories = ProdCategory.all
    @articles = Article.order("id desc").limit(3)
    @events = Event.order("publish_at desc").limit(3)
  end

  def about
    @about_office = CompanyProfile.where( brand_story: nil ).order("play_order desc")
    @about_brand_story = CompanyProfile.where( office_image: nil ).order("play_order desc").last 
  end

  def contact
  	
  end

end
