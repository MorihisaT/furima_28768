class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :discript, :category_id, :status_id, :delivery_fee_id, :area_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end
end
