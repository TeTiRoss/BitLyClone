class Link < ApplicationRecord
  validates :name, :path, presence: true
  validates_format_of :path, with: /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i

  after_create :check_path

  private

  def check_path
    unless self.path[/^https?:\/\//]
      self.path = "http://#{self.path}"
      self.save
    end
  end
end
