class OrdersController < ApplicationController

  before_action :set_item, only: [:index, :create]
  def index
    @address_order = AddressOrder.new
  end
  
  def create
    @address_order = AddressOrder.new(postal_code: order_params[:postal_code], area_id: order_params[:area_id], city: order_params[:city], house_number: order_params[:house_number], building_name: order_params[:building_name], phone_number: order_params[:phone_number],item_id: order_params[:item_id], user_id: order_params[:user_id])
    # if  Order.where(item_id: @order.item_id).nil?
      if @address_order.valid?
        pay_item
        @address_order.save
        return redirect_to root_path
      else
        render 'index'
      end
    # else
    #   render 'index'
    # end
  end

  private
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.permit(:postal_code, :area_id, :city, :house_number, :building_name, :phone_number, :token).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

end