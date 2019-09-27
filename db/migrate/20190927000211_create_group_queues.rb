class CreateGroupQueues < ActiveRecord::Migration[5.2]
  def change
    create_table :group_queues do |t|
      t.text :name, null: false
      t.boolean :is_playing, null: false, default: false
      t.references :user, foreign_key: true
      t.integer :cur_members, default: 0
      t.integer :max_memebers, default: 20
      t.integer :cur_songs, default: 0
      t.integer :max_songs, default: 20
      t.boolean :is_private, null: false, default: false
      t.text :password_hash

      t.timestamps
    end
  end
end
