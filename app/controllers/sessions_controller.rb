class SessionsController < ApplicationController
    # skip_before_action :authenticate_user, only: [:new, :create]
    before_action :redirect_if_authenticated, only: [:new, :create]
  
    def new
      @user = User.new
    end
  
    def create
      # byebug
      @user = User.find_by(email: params[:user][:email])
      if @user.present? && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_path, flash: { success: 'Logged in successfully' }
      else
        render :new, flash: { errors: 'Please register first...!' }
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path, flash: { success: 'Logged Out' }
    end
end
