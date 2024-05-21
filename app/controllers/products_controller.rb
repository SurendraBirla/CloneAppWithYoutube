class ProductsController < ApplicationController
    before_action :find_admin, only: [:create,:new, :destroy, :index, :show]

    def index
    	@products = Product.all
        # debugger
    end

    def new
        @product = Product.new
    end

    def create
        # debugger
        @product = Product.new(product_params)
        @product.user_id = current_user.id
        if @product.save
            redirect_to products_path, notice: "Product was successfully created...!"
        else
        end
    end

    def show
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:product_id])
        if @product.update(product_params)
            # render notice: {" "}
        else
        end
    end

    def destroy
        # byebug
        # if @current_user.role_id == @role.id
        # debugger
            @product = Product.find(params[:product_id])
            if @product
              @product.destroy
              redirect_to products_path, {message: "Product successfully deleted...!"}
           else
             render json: {message: "As User you cann't delete product...!"}
           end
    end

    private

	def product_params
        # debugger
		# params.permit(:name, :price, :image)
        params.require(:product).permit(:name, :price, :image)
	end

	
end
