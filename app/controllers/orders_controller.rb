class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :sold_out_item, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @order_delivery = OrderDelivery.new
    redirect_to root_path if current_user == @item.user
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_delivery).permit(:postal_code, :source_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out_item
    set_item
    redirect_to root_path if @item.order.present?
  end
end
