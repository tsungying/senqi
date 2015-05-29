class ProdCategoriesController < ApplicationController
  before_action :current_language_product_categories

  def index

  end

  def show    
    product_category = @prod_categories.find_by_id(params[:id])
    if product_category
      @products = product_category.products.on_sale
    else
      redirect_to prod_categories_url(locale: I18n.locale)
    end
  end

end
