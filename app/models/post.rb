class Post < ActiveRecord::Base
  has_and_belongs_to_many :songs
  attr_accessible :copy, :image, :thumbnail, :title, :song_ids

  accepts_nested_attributes_for :songs

  mount_uploader :image, ImageUploader

  validates_presence_of :title, :image

  has_many :guesses
end
