class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.text :title
      t.text :artist
      t.text :album_uri
      t.text :preview_uri
      t.text :spotify_uri
      t.boolean :is_playing
      t.references :queue, foreign_key: true

      t.timestamps
    end
  end
end
