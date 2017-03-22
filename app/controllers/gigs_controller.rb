class GigsController < ApplicationController
  before_action :find_gig, only: [:show, :edit, :update, :destroy]
  
  def index
    @gigs = Gig.all.order("created_at DESC")
  end
  
  def show
  end
  
  def new
    # @gig = Gig.new
    @gig = current_user.gig.build
  end
  
  def create
    # @gig = Gig.new(params.require(:gig).permit(:title, :description, :promoter))
    # @gig = Gig.new(gig_params)
    @gig = current_user.gig.build(gig_params)
    
    if @gig.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @gig.update(gig_params)
      redirect_to gig_path(@gig)
    else
      render 'edit'
    end
  end
  
  def destroy
    @gig.destroy
    redirect_to root_path
  end
    

  private
  
  def gig_params
    params.require(:gig).permit(:title, :description, :promoter)
  end
  
  def find_gig
    @gig = Gig.find(params[:id])
  end
  
  
end
