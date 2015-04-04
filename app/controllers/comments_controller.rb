class CommentsController < ApplicationController
	before_filter :load_commentable

  def index
  	#@comments = @commentable.comments
  end

  def show
  end

  def new
		# @comment = @commentable.comments.new
  end

  def create  	
  	@comment = @commentable.comments.new(comment_params)
  	if @comment.save
  		# redirect_to [@category, @commentable, section: "comments"]
  		redirect_to blog_category_article_path(@category, @commentable, section: "comments")
  	else
  		# render template: 'articles/show'
  		flash[:warning] = "欄位不能空白！"
  		redirect_to blog_category_article_path(@category, @commentable, section: "leave_comment")

  	end
  end

  def edit
  end

  private

  	def load_commentable
  		# 藉由 form 傳遞 params[:path] 參數進來
  		# http://localhost:3000/blog_categories/2/articles/3
  		parent_resource, parent_id, resource, id = params[:path].to_s.split('/')[1,4]
  		@category = parent_resource.singularize.classify.constantize.find(parent_id)
  		@commentable = resource.singularize.classify.constantize.find(id)
  	end

  	def comment_params
  		params.require(:comment).permit(:name, :content)
  	end
end
