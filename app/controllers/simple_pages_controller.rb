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

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end

end
