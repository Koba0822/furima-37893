class ItemsController < ApplicationController
  # ログインしていないユーザーはログインページに促す
  before_action :authenticate_user!, except: [:index, :show]

  # 重複処理をまとめる
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  before_action :login_item

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def edit
    else
      redirect_to root_path
    end
  end

  def show
  end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path(item_params)
    else
      render 'edit'
    end
  end

  def destroy
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :item_category_id, :item_status_id, :item_shipping_cost_id,
                                 :prefecture_id, :item_shipping_date_id, :item_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def login_item
    if @item.user_id == current_user.id 
  end
end
