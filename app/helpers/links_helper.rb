module LinksHelper
  def create_link(link_name)
    'http://' + request.host + '/' + link_name
  end
end
