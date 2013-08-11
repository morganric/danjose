class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :url
      t.string :provider
      t.text :embed_code

      t.timestamps
    end
  end
end
