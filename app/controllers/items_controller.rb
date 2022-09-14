class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  
  def index
  end

  def create
  end

  def new
  end

end
