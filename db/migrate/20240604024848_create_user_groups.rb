class CreateUserGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :user_groups do |t|

      t.references :user, foreign_key: true, null: false
      t.references :group, foreign_key: true, null: false

      t.timestamps
    end
  end
end
