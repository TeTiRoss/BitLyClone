class LinksController < ApplicationController
  before_action :set_link, only: [:show, :shortened]


  def new
    @link = Link.new
  end

  def create
    @link = Link.new(path: params[:link][:path])
    @link.name = 'ShortenLink'
    if @link.save
      redirect_to shortened_links_path(id: @link.id)
    else
      flash.now.alert = 'Not valid link'
      render :new
    end
  end

  def show
    redirect_to "http://#{link.path}"
  end

  def shortened
  end

  private

  def set_link
    @link = Link.find(params[:id])
  end
end
