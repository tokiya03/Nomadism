class UserGroup < ApplicationRecord

  belongs_to :user
  belongs_to :group, dependent: :destroy

end
