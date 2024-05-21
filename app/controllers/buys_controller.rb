class BuysController < ApplicationController
    before_action :find_admin
    
    def index
        if current_user.id == @role.id 
            @buys = Buy.all
        else
            @buys = current_user.buys.includes(:product)
        end

    end

    def create
        # debugger
        @buy = Buy.new(buy_params)
        @buy.user_id = current_user.id
        if @buy.save
            redirect_to buys_path, message: "Your order is confirmed...!"
        else
            redirect_to products_path, alert: "Something went wrong. Please try again."
        end
    end

    def cancel
    end

    private 

    def buy_params
        params.require(:buy).permit(:product_id)
    end

end
