class AddGenreToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :genre, :string
  end
end
