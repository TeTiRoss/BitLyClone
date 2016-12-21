class Link < ApplicationRecord
  include LinkName
  include LinkPath

  validates :path, presence: true
  validates_format_of :path, with: /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i
end
