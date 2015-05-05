class Admin::UsersController < Admin::BaseController
  def index
  	@users = User.all.page(params[:page])
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
  	@user = User.find(params[:id])
  	@user.toggle!(:admin)
  	respond_to do |format|
		  format.js {render inline: "location.reload();" }
		end
  end
end
