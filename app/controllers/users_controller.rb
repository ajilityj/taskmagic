class UsersController < ApplicationController

  before_filter :authorize

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Your account is now active."
    else
      render 'new'
    end
  end

end