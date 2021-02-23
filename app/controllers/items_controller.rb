class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      @items = @item.inculede(:user)
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :image, :category_id, :item_condition_id, :delivery_price_id, :prefectures_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end
end
