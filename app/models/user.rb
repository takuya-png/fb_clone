class User < ApplicationRecord
  has_many :picture_blogs
  validates :name, presence: true
  validates :email, presence: true
end
