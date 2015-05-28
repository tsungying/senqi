class BlogCategoriesController < ApplicationController

  def index
    current_language_blog_categories 
    @articles = current_language_articles.page(params[:page]).per(10)
    @latest_articles = current_language_articles.limit(10)
    @comments = Comment.where(commentable_type: 'Article', commentable_id: current_language_articles.pluck(:id).uniq).order("id desc").limit(10)
  end

  def show
    current_language_blog_categories 
    category = @categories.find_by_id(params[:id])
    if category
      articles = category.articles.order("id desc")
      @articles = articles.page(params[:page]).per(10)
      @latest_articles = articles.limit(10) 
      @comments = Comment.where(commentable_type: 'Article', :commentable_id => articles.pluck(:id).uniq).order("id desc").limit(10)      
    else
      redirect_to blog_categories_url(locale: params[:locale])
    end
  end

end
