class SimplePagesController < ApplicationController
  def index
  end

  def landing_page
  	@productsDisplay = Product.count
  	@products = Product.limit(@productsDisplay/2)
  end
end
