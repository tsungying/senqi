class PagesController < ApplicationController

  def index
    @prod_categories = ProdCategory.all
    @articles = Article.order("id desc").limit(3)
  end

  def about

  end

end
