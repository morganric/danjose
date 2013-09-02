class Guess < ActiveRecord::Base
  attr_accessible :guess_id, :photo_id, :correct

  belongs_to :post
end
