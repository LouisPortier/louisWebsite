class SimplePagesController < ApplicationController
  def index
  end

  def landing_page
		@products = Product.order("RANDOM()").limit(Product.count/2)
  end

  def about
  end

  def redirectToLanding
  	redirect_to '/simple_pages/landing_page'
  end

end
