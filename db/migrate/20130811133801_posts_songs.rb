class PostsSongs < ActiveRecord::Migration
  def up
  	create_table 'posts_songs', :id => false do |t|
	    t.column :post_id, :integer	
	    t.column :song_id, :integer
	end
  end

  def down
  end
end
