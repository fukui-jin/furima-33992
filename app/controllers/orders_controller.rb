class OrdersController < ApplicationController
  before_action :authenticate_user!, expect: :index
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order_buyer = OrderBuyer.new
  end

  def create
    @order_buyer = OrderBuyer.new(order_params)
    if @order_buyer.valid?
      @order_buyer.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_buyer).permit(:user_id, :item_id, :postal_code, :prefectures, :city, :address, :building_name, :phone_number, :price).merge(user_id: current_user.id)
  end

end