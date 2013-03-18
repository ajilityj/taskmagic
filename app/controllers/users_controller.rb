class UsersController < ApplicationController

  before_filter :require_login
  before_filter :admin_only, :except => [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Your account is now active."
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      if current_user
        redirect_to root_url
      else
        redirect_to users_url, notice: 'User was successfully updated.'
      end
    else
      render action: "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_url
  end

end
