class Admin::CompanyInfosController < Admin::BaseController
  before_action :find_company_info, only: [:show, :edit, :update, :destroy]

  def index
    @company_infos =CompanyInfo.all.group_by(&:language)
  end

  def show
  end

  def new
    @company_info = CompanyInfo.new
  end

  def create
    @company_info = CompanyInfo.new(company_info_params)
    if @company_info.save
      redirect_to admin_company_infos_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @company_info.update_attributes(company_info_params)
      redirect_to admin_company_infos_path
    else
      render :edit
    end
  end

  def destroy
    @company_info.destroy
    redirect_to admin_company_infos_path
  end

  private
    def company_info_params
      params.require(:company_info).permit(:image, :title, :content, :language)
    end

    def find_company_info
      @company_info = CompanyInfo.find_by(id: params[:id])
    end
end
