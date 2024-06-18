class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.references :user, foreign_key: true, null: false
      t.string :name, null: false
      t.text :caption, null: false
      t.string :address, null: false, default: ""

      t.timestamps
    end
  end
end
