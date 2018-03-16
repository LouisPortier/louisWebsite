class SimplePagesController < ApplicationController
  def index
  end

  def landing_page
		@products = Product.order("RANDOM()").limit(Product.count/2)
  end
end
