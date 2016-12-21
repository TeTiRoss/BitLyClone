class LinksController < ApplicationController
  before_action :set_link, only: [:show]

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(path: params[:link][:path])

    if @link.save
      session[:link_path] = @link.path
      session[:link_name] = @link.name
      redirect_to root_path, notice: 'Your link has been shortened'
    else
      flash.now.alert = 'Not valid link'
      render :new
    end
  end

  def show
    link = Link.find_by(name: params[:name])
    redirect_to link.path
  end
end
