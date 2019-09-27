class CreateGroupQueues < ActiveRecord::Migration[5.2]
  def change
    create_table :group_queues do |t|
      t.text :name
      t.boolean :is_playing
      t.references :user, foreign_key: true
      t.integer :cur_members
      t.integer :max_memebers
      t.integer :cur_songs
      t.integer :max_songs
      t.text :is_private
      t.text :password_hash

      t.timestamps
    end
  end
end
