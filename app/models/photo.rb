	class Photo < ActiveRecord::Base
  attr_accessible :embed_code, :image, :published, :song_artist, :song_title, :song_url, :thumbnail, :title

  mount_uploader :image, ImageUploader

  validates_presence_of :image, :title

  has_many :guesses
  
end
