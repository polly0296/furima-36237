class OrdersController < ApplicationController

  def index
    @order_delivery = OrderDelivery.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      @order_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_delivery).permit(:postal_code, :source_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
