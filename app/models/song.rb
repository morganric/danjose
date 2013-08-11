class Song < ActiveRecord::Base
has_and_belongs_to_many :posts
  attr_accessible :artist, :embed_code, :provider, :title, :url

  accepts_nested_attributes_for :posts

  validates_presence_of :artist, :title, :url


end
