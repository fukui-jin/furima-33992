class ItemsController < ApplicationController

  # authenticate_user!

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :image, :category_id, :item_condition_id, :delivery_price_id, :prefectures_id, :delivery_time_id, ).merge(user_id: current_user.id)
  end
end
