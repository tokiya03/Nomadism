class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :user_groups, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true
  validates :email, presence: true
  validates :image, presence: true


  # ゲストユーザでログインするためのguestメソッドの記述
  GUEST_USER_EMAIL = 'guest@example.jp'
  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲストユーザー'
    end
  end

  def guest_user?
    email == GUEST_USER_EMAIL
  end
end