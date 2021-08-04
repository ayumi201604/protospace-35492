class PrototypesController < ApplicationController
  
  before_action :move_to_index, except: [:index, :show]

  def index
     @prototypes = Prototype.all
     @prototypes = Prototype.includes(:user)
  end

  def new
      @prototype = Prototype.new
  end

  def create
       @prototype = Prototype.new(prototype_params)
    if @prototype.save
       redirect_to prototypes_path(@prototype)
       else
        render :new
    end 
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
      @prototype = Prototype.find(params[:id])
    unless user_signed_in? && current_user.id == @prototype.user_id
      redirect_to root_path
      
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype.id)
      else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  private
  def prototype_params
    params.require(:prototype).permit(:concept, :image, :title, :catch_copy).merge(user_id: current_user.id)
  end
  #params{prototype:{:prototype_title:"konnitiwa"}}
  def move_to_index
     unless user_signed_in?
       redirect_to action: :index
     end
   end
end

