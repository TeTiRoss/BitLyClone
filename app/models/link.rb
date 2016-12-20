class Link < ApplicationRecord
  validates :name, :path, presence: true
end
