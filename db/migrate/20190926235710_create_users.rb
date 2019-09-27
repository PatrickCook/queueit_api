class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :username, null: false
      t.text :password_hash, null: false
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
