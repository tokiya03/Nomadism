class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :user_groups, dependent: :destroy

  has_one_attached :profile_image

  validates :name, presence: true

  # 画像のサイズ調整をサーバ側で行うための記述
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

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