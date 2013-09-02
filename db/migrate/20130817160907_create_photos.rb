class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :image
      t.string :thumbnail
      t.string :song_title
      t.string :song_artist
      t.string :song_url
      t.boolean :published
      t.text :embed_code

      t.timestamps
    end
  end
end
