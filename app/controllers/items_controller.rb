class ItemsController < ApplicationController
  def index
   @items = Item.all
  end

  def new
  end

  def create
   @item = Item.new(syuppinn_params)
  end

  private

  def syuppinn_params
    params.require(:item).permit(:name, :profile, :price, :category_id, :status_id, :image, :money_responsibility_id, :outgoing_area_id, :going_days_id).merge(user_id: current_user.id)
  end
end
