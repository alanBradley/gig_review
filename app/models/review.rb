class Review < ActiveRecord::Base
  belongs_to :gig
  belongs_to :user
end
