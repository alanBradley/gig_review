class AddGigIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :gig_id, :integer
  end
end
