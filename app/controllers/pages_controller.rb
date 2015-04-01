class PagesController < ApplicationController

  def index
    @prod_categories = ProdCategory.all
    @articles = Article.order("id desc").limit(3)
    @events = Event.order("publish_at desc").limit(3)
  end

  def about

  end

  def contact
  	
  end

end
