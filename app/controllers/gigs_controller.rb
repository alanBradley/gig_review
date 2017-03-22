class GigsController < ApplicationController
  
  def index
  end
  
  def new
    @gig = Gig.new
  end
  
  def create
    # @gig = Gig.new(params.require(:gig).permit(:title, :description, :promoter))
    @gig = Gig.new(gig_params)
  end
  
  private
  
  def gig_params
    params.require(:gig).permit(:title, :description, :promoter)
  end
  
  
end
