class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.string :title
      t.string :artist
      t.string :url
      t.string :provider
      t.text :embed_code
      t.boolean :correct
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
