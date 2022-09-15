class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @item = Item.new
  end

end

private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :item_category_id, :prefecture_id, :item_status_id, :item_shipping_cost_id, :item_prefecture_id, :item_shipping_date_id, :item_price).merge(user_id: current_user.id)
  end
