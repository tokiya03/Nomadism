class Group < ApplicationRecord

  has_many :user_groups, dependent: :destroy
  has_many :users, through: :user_groups, source: :user
  has_many :chats, dependent: :destroy

  has_one_attached :group_image

  validates :name, presence: true
  validates :introduction, presence: true

  # 画像のサイズ調整をサーバ側で行うための記述
  def get_group_image(width, height)
    unless group_image.attached?
      file_path = Rails.root.join('app/assets/images/no_group_image.jpg')
      group_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    group_image.variant(resize_to_fill: [width, height]).processed
  end

  # ゲストユーザーはグループ作成を不可とするための記述
  GUEST_USER_EMAIL = 'guest@example.jp'

  def guest_user?
    email == GUEST_USER_EMAIL
  end

  def is_owned_by?(user)
    owner_id == user.id
  end

  def includesUser?(user)
    user_groups.exists?(user_id: user.id)
  end
end
