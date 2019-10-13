class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.text :title, null: false
      t.text :artist, null: false
      t.text :album_image_url, null: false
      t.text :preview_uri
      t.text :spotify_uri, null: false
      t.boolean :is_playing, null: false, default: false
      t.boolean :has_played, null: false, default: false
      t.references :group, foreign_key: true, null: false

      t.timestamps
    end
  end
end
