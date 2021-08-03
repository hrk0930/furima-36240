class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  #before_action :sold_out_item, only: [:index]


  def index
   @items = Item.all
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

  


  private

  def syuppinn_params
    params.require(:item).permit(:name, :profile, :price, :category_id, :status_id, :image, :money_responsibility_id, :outgoing_area_id, :going_days_id).merge(user_id: current_user.id)
  end

   #def sold_out_item
    #redirect_to root_path if @items.buy_management.present?
   #end

end
