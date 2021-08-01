class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  #def new
  #end

  #def create
   # @item = Item.new(prototype_params)
  #end

  #private

  #def prototype_params
    #params.require(:item).permit(:title, :image, :catch_copy, :concept).merge(user_id: current_user.id)
  #end
end
