class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def create
  end

  def new
  end

end

private


