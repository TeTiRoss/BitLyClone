module Link::LinkPath
  extend ActiveSupport::Concern

  included do
    before_create :check_path
  end

  def check_path
    unless self.path[/^https?:\/\//]
      self.path = "http://#{self.path}"
    end
  end
end
