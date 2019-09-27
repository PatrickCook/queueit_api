class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :username
      t.text :password_hash
      t.integer :role

      t.timestamps
    end
  end
end
