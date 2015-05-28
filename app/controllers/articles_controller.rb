class ArticlesController < ApplicationController

  def index
    if params[:article_keyword]||nil
      current_language_blog_categories
      @comments = Comment.where(commentable_type: 'Article', commentable_id: current_language_articles.pluck(:id).uniq).order("id desc").limit(10)
      @latest_articles = current_language_articles.limit(10)
      @articles = current_language_articles.search(params[:article_keyword]).page(params[:page]).per(10)      
    else
      redirect_to blog_categories_url(locale: I18n.locale)
    end

  end

  def show
    current_language_blog_categories
    blog_category = current_language_blog_categories.find_by_id(params[:blog_category_id])
    if blog_category
      articles = blog_category.articles.order("id desc")
      @latest_articles = articles.limit(10)
      @article = Article.find(params[:id])
      @comments = @article.comments.order("created_at desc").page(params[:page]).per(10)
      @comment = @article.comments.new
    else
      redirect_to blog_categories_url(locale: I18n.locale)
    end
  end

end
