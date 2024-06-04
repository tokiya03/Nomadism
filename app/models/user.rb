class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :user_groups, dependent: :destroy

  has_one_attached :image
end
