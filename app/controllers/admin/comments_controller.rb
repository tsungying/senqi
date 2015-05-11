class Admin::CommentsController < Admin::BaseController
  def index
  	@comments = Comment.where(ancestry: nil).order(id: :desc).page(params[:page])
  end

  def show
  end

  def new
  	@comment = Comment.new(parent_id: params[:parent_id], current_page: params[:page])
  end

  def create
  	@comment = Comment.new(comment_params)
  	if @comment.save
  		redirect_to admin_comments_url(page: params[:comment][:current_page])
  	else
  		render :new
  	end

  end

  def edit
  	@comment = Comment.find(params[:id])
  	@comment.current_page = params[:page]
  end

  def update
		@comment = Comment.find(params[:id])
		if @comment.update_attributes(comment_params)
			redirect_to admin_comments_url(page: params[:comment][:current_page])
		else
			render :edit
		end
  end

  def destroy
  	comment = Comment.find(params[:id])
  	comment.destroy
  	redirect_to admin_comments_url(page: params[:page])
 	end

 	private

 		def comment_params
 			params.require(:comment).permit(:name, :content, :parent_id, :current_page)
 		end
end
