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
    params.require(:item).permit(:image, :name, :discript, :category, :status, :delivery_fee, :area, :delivery_time, :price).merge(use_id: current.user.id)
  end
end
