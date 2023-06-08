class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_path, only: [:edit, :destroy]
  before_action :payed_redirect, only: :edit

  def index
    @items = Item.order("created_at DESC")
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

  def show

  end

  def edit
    
  end

  def update
    if @item.update_attributes(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy 
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:product_name,:image,:explanation,:category_id,:condition_id,:delivery_type_id,:prefecture_id,:shipment_date_id,:cost).merge(user_id:current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def move_to_path
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def payed_redirect
    if @item.order.present?
      redirect_to root_path
    end
  end
end