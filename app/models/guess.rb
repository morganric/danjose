class Guess < ActiveRecord::Base
  attr_accessible :artist, :correct, :embed_code, :post_id, :provider, :title, :url, :user_id

  belongs_to :user
  belongs_to :post

  validates_presence_of :title, :artist
end
