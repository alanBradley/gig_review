class ReviewsController < ApplicationController
  before_action :find_gig
  
  def new
    @review = Review.new
  end
  
  def create

    @review = Review.new(review_params)
    @review.gig_id = @gig.id
    @review.user_id = current_user.id
    
    if @review.save
      redirect_to gig_path(@gig)
    else
      render 'new'
    end
  end
  
  private
  
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
  
    def find_gig
      #find gig first before adding review
      @gig = Gig.find(params[:gig_id])  
    end
  
end
