class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,]
  before_action :move_to_index, only: [:edit, :update, :show]

  def index
    @items = Item.order(created_at: :desc)
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
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :image, :category_id, :item_condition_id, :delivery_price_id, :prefectures_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless @item.user.id == current_user.id
      redirect_to action: :index
    end
  end
end
