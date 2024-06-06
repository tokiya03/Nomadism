class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :caption, presence: true
  validates :address, presence: true

end
