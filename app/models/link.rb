class Link < ApplicationRecord
  validates :name, :path, presence: true
  validates_format_of :path, with: %r{
    /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i
  }x
end
