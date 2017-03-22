class GigsController < ApplicationController
  before_action :find_gig, only: [:show, :edit, :update, :destroy]
  
  def index
    if params[:category].blank?
      @gigs = Gig.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @gigs = Gig.where(:category_id => @category_id).order("created_at DESC")
    end
  end
  
  def show
  end
  
  def new
    # @gig = Gig.new
    @gig = current_user.gigs.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end
  
  def create
    # @gig = Gig.new(params.require(:gig).permit(:title, :description, :promoter))
    # @gig = Gig.new(gig_params)
    @gig = current_user.gigs.build(gig_params)
    @gig.category_id = params[:category_id]
    
    if @gig.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end
  
  def update
    @gig.category_id = params[:category_id]
    
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
    params.require(:gig).permit(:title, :description, :promoter, :category_id)
  end
  
  def find_gig
    @gig = Gig.find(params[:id])
  end
  
  
end
