class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|

      t.string :name, null: false
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.string :profile_image_id, null: false
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
