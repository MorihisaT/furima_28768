class OrdersController < ApplicationController
  before_action :move_to_sign_in
  before_action :move_to_index
  before_action :set_item, only: [:index, :create]

  def index
    @address_order = AddressOrder.new
  end

  def create
    @address_order = AddressOrder.new(order_params)
    if @address_order.valid? && Order.where(item_id: @item.id).empty?
      pay_item
      @address_order.save
      redirect_to root_path
    else
      flash[:alert] = 'Purchase failed'
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.permit(:item_id, :postal_code, :area_id, :city, :house_number, :building_name, :phone_number, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_sign_in
    flash[:alert] = 'You need to sign in or sign up before continuing.'
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_index
    if Item.find(params[:item_id]).user_id == current_user.id || Order.where(item_id: params[:item_id]).exists?
      redirect_to root_path
    end
  end
end
