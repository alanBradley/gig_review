class Gig < ActiveRecord::Base
  belongs_to :user
  belong_to :category
end
