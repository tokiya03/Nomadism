class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|

      t.references :user, foreign_key: true, null: false
      t.references :group, foreign_key: true, null: false
      t.string :message, null: false

      t.timestamps
    end
  end
end
