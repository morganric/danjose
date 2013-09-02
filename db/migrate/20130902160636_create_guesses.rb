class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :photo_id
      t.integer :guess_id

      t.timestamps
    end
  end
end
