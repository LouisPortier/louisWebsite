require 'rails_helper'

describe ProductsController, type: :controller do

	context "GET #index" do
		it "goes to index" do
			get :index
	    expect(response).to be_ok
	    expect(response).to render_template('index')
		end
	end

	context "GET #show" do
		before do
			@product = FactoryBot.create(:product)
		end
		it 'goes to the product show template' do
    get :show, params: { id: @product.id }
    expect(response).to be_ok
    expect(response).to render_template('show')
    end
  end

  context "GET #new" do
  	before do
      @admin = FactoryBot.create(:admin)
      @user = FactoryBot.create(:user)
    end

    context "If user is admim" do
      before do
        sign_in @admin
      end
      it "show new product page" do
        get :new
        expect(response).to be_ok
        expect(response).to render_template("new")
      end
    end

    context "If user isn't admin" do
      before do
        sign_in @user
      end
      it "redirects to home page" do
        get :new
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
  	end
  end

  describe 'GET #edit' do
    before do
      @product = FactoryBot.create(:product)
      @admin = FactoryBot.create(:admin)
      @user = FactoryBot.create(:user)
    end

    context "If user is admin" do
      before do
        sign_in @admin
      end
      it "show edit page" do
        get :edit, params: {id: @product.id}
        expect(response).to be_ok
        expect(response).to render_template("edit")
      end
    end

    context "If user not admin" do
      before do
        sign_in @user
      end
      it "redirects to home page" do
        get :edit, params: {id: @product.id}
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
    
    context "If user not logged in" do
      it "redirects to home page" do
        get :edit, params: {id: @product.id}
        expect(response).to redirect_to(root_path)
      end
    end
  end

  context "POST #create" do
    before do
      @admin = FactoryBot.create(:admin)
      @product = FactoryBot.create(:product)
      sign_in @admin
    end
    it 'if valid, it is stored.' do
      post :create, params:{product: {id: @product.id ,name: @product.name, description: @product.description, image_url: @product.image_url, price: @product.price}}
      expect(assigns(:product)).to be_a(Product)
    end

    #Testing the rest in the product_spec model.
  end

  context "POST #update" do
  	before do
      @admin = FactoryBot.create(:admin)
      @product = FactoryBot.create(:product)
      sign_in @admin
    end
  	it "updates info of product" do
  		@newName = { name: "TESTEST"}
	    post :update, params: {id: @product.id, product: @newName }
	    @product.reload
	    expect(@product.name).to eq "TESTEST"
	  end
	end

	context "DELETE HAHAHAHAHA !" do
		before do
      @admin = FactoryBot.create(:admin)
      @product = FactoryBot.create(:product)
      sign_in @admin
    end
		it "deletes the product" do
			delete :destroy, params: { id: @product.id }
      expect(response).to redirect_to products_path
		end
	end
end