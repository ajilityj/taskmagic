class PlatformsController < ApplicationController

  before_filter :require_login
  before_filter :admin_only

  def index
    @platforms = Platform.all
  end

  def show
    @platform = Platform.find(params[:id])
  end

  def new
    @platform = Platform.new
  end

  def edit
    @platform = Platform.find(params[:id])
  end

  def create
    @platform = Platform.new(params[:platform])

    if @platform.save
      redirect_to platforms_url, notice: 'Platform was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @platform = Platform.find(params[:id])

    if @platform.update_attributes(params[:platform])
      redirect_to @platform, notice: 'Platform was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @platform = Platform.find(params[:id])
    @platform.destroy

    redirect_to platforms_url
  end
end
