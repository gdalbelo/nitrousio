class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  layout 'admin'
  
  # GET /users
  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_url
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    if user_params[:password].blank?
      @user.update_without_password(user_params_without_password)
    else
      @user.update(user_params)
    end

    if @user.valid?
      if @user == current_user
        sign_in(@user, bypass: true)
      end

      redirect_to admin_users_url
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to admin_users_url, notice: 'Usuário excluído.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def user_params_without_password
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
      user_params
    end
end
