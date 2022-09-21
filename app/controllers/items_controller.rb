class ItemsController < ApplicationController
  # ログインしていないユーザーはログインページに促す
  before_action :authenticate_user!, except: [:index, :show]

  # 重複処理をまとめる
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
    # ログインしているユーザーと同一であればeditファイルが読み込まれる
    #if @item.user_id == current_user.id && @item.order.nil?
    #else
      #redirect_to root_path
    #end
    @item = Item.find(params[:id])
  end

  def show
  end

  def update
    @item.update(item_params)
    # バリデーションがOKであれば詳細画面へ
    if @item.valid?
      redirect_to item_path(item_params)
    else
      # NGであれば、エラー内容とデータを保持したままeditファイルを読み込み、エラーメッセージを表示させる
      render 'edit'
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
end
