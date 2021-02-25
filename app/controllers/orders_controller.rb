class OrdersController < ApplicationController
  before_action :authenticate_user!, expect: :index
  def index
    @item = Item.find(params[:item_id])
    @order_buyer = OrderBuyer.new
  end
  

  def create
    @item = Item.find(params[:item_id])
    @order_buyer = OrderBuyer.new(order_params)
    if @order_buyer.valid?
      pay_item
      @order_buyer.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_buyer).permit(:postal_code, :prefectures_id, :city, :address, :building_name, :phone_number).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_087fb5c063c2d868e77aa73f"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end