class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item,  only: [:show, :edit, :update, :destroy]
  before_action :edit_user, only: [:edit, :update, :destroy]
  #before_action :sold_out_item, only: [:index]


  def index
   @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
   @item = Item.new(syuppinn_params)
      if @item.save
        redirect_to root_path
      else
        render :new
      end
  end

  def show
  end

  def edit
  end

  def update
    
      if @item.update(syuppinn_params)
        redirect_to item_path
       else
        render :edit
      end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  


  private

  def syuppinn_params
    params.require(:item).permit(:name, :profile, :price, :category_id, :status_id, :image, :money_responsibility_id, :outgoing_area_id, :going_days_id).merge(user_id: current_user.id)
  end
   #def sold_out_item
    #redirect_to root_path if @items.buy_management.present?
   #end

   def edit_user
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
     end
   end

   def set_item
     @item = Item.find(params[:id])
   end
   
end