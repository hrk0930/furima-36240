class OrdersController < ApplicationController
  before_action :authenticate_user!,   only: [:index, :create]
  before_action :set_item,             only: [:index, :create]
  before_action :user_redirect,        only: [:index, :create]

   def index
    @order_address = OrderAddress.new
   end

   def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
       pay_item
       @order_address.save
       return redirect_to root_path
    else
       render :index
    end
   end

   private

      def order_params
        params.require(:order_address).permit(:post_number, :city, :address, :building, :telephone_number, :outgoing_area_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
      end

      def pay_item      
         Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
             Payjp::Charge.create(
               amount: @item.price,           # 商品の値段
               card: order_params[:token],    # カードトークン
               currency: 'jpy'                # 通貨の種類（日本円）
             )
      end
      #出品者が購入ページに遷移した時、または売れた商品の購入ページに遷移した時はroot＿pathに遷移される
       def user_redirect
        redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
       end
      def set_item
       @item = Item.find(params[:item_id])
      end
end
