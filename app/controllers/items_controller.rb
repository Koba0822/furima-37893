class ItemsController < ApplicationController
  # ログインしていないユーザーはログインページに促す
  before_action :authenticate_user!, except: [:index, :show]

  # 重複処理をまとめる
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items =Item.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :item_catetegory_id, :item_status_id, :item_shipping_cost_id, :prefecture_id, :item_shipping_date_id, :item_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
