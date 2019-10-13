class CreateGroupQueues < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.text :name, null: false
      t.boolean :is_playing, null: false, default: false
      t.integer :cur_members, default: 0
      t.integer :max_members, default: 20
      t.integer :cur_songs, default: 0
      t.integer :max_songs, default: 20
      t.boolean :is_private, null: false, default: false
      t.text :password_hash
      t.references :owner
      t.timestamps
    end
  end
end
