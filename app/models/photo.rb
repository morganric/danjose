class Photo < ActiveRecord::Base
  attr_accessible :embed_code, :image, :published, :song_artist, :song_title, :song_url,
   :thumbnail, :title, :description, :user_id, :slug

  extend FriendlyId
  friendly_id :title, use: :history

  mount_uploader :image, ImageUploader

  validates_presence_of :image, :title, :song_title, :song_url

  has_many :guesses
  belongs_to :user
  
end
