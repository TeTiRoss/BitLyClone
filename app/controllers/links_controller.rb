class LinksController < ApplicationController
  before_action :set_link, only: [:show, :shortened]

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(path: params[:link][:path])
    @link.name = create_link_name

    if @link.save
      redirect_to shortened_links_path(id: @link.id)
    else
      flash.now.alert = 'Not valid link'
      render :new
    end
  end

  def show
    redirect_to @link.path
  end

  def shortened
  end

  private

  def create_link_name
    valid_name = false
    while valid_name == false
      if Link.find_by(name: random_name).blank?
        valid_name = true
        link_name = random_name
      end
    end
    link_name = 'http://' + request.host + '/' + link_name
  end

  def random_name(length = 7)
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ0123456789'
    name = ''
    length.times { name << chars[rand(chars.size)] }
    name
  end

  def set_link
    @link = Link.find(params[:id])
  end
end
