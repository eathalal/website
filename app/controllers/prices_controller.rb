class PricesController < ApplicationController
  def index
    @products = Product.order(:category_id)
  end
end