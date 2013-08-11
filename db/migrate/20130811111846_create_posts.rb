class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :image
      t.string :thumbnail
      t.text :copy
      t.string :title


      t.timestamps
    end
  end
end
