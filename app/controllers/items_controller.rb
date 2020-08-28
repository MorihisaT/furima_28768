class ItemsController < ApplicationController
  before_action :move_to_sign_in, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
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
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :discript, :category_id, :status_id, :delivery_fee_id, :area_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end

  def move_to_sign_in
    flash[:alert] = 'You need to sign in or sign up before continuing.'
    redirect_to new_user_session_path unless user_signed_in?
  end
end
