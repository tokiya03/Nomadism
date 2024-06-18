class Post < ApplicationRecord
  scope :with_user_name, -> {
    map { |o|
      o.attributes.symbolize_keys.select { |k, v| k.match(/id|user_id|name|caption|address|latitude|longitude/) }
      .merge(user_name: o.user.name)
    }
  }

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :caption, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode

  # ゲストユーザーは投稿を不可とするための記述
  GUEST_USER_EMAIL = 'guest@example.jp'

  def guest_user?
    email == GUEST_USER_EMAIL
  end
end
#[:id, :user_id, :name, :caption, :address, :created_at, :updated_at, :latitude, :longitude]
#[:id, :created_at, :updated_at, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :is_active]