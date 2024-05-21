class RegistrationsController < ApplicationController

  before_action :set_role, only: [:create]
     
  # skip_before_action :authenticate_user, only: [:new, :create]
  # before_action :redirect_if_authenticated, only: [:new, :create] 

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role_id = @role_id
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, flash: { success: 'Registration successfully' }
    else
      render :new
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :username, :mobile_nu, :email, :password, :password_confirmation)
  end
   
  def set_role
  	@role_id = Role.find_by(name:"User").id
  end

end
