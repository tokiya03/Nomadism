class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.references :user, foreign_key: true, null: false
      t.string :shop_name, null: false
      t.text :caption, null: false
      t.string :address, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false

      t.timestamps
    end
  end
end
