class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: :index

  def index
    @order_address = OrderAddress.new
  end

  def create
    binding.pry
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address)
    .permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :tel_number)
    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end


  def pay_item
    @item = Item.find(params[:id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Change.create(
      amount: @item.cost,
      card:   order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
