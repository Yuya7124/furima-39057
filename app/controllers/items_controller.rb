class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :move_to_index, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item =Item.create(item_params)
  end
  
  private
  def item_params
    params.require(:item).permit(:product_name,:image,:explanation,:category_id,:condition_id,:delivery_tyoe_id,:prefecture_id,:shipment_date_id,:cost)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
