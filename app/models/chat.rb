class Chat < ApplicationRecord

  belongs_to :user
  belongs_to :group

  validates :message, presence: true

  def includesUser?(user)
    user_groups.exists?(user_id: user.id)
  end
end
