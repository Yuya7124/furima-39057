class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_path, only: [:index, :create]
  before_action :payed_redirect, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_address_params
    params.require(:order_address)
    .permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :tel_number)
    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end


  def pay_item
    set_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.cost,
      card:   order_address_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_path
    set_item
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def payed_redirect
    if @item.order.present?
      redirect_to root_path
    end
  end
end
