class TransactionsController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index

  end
  
  def create
    @transaction = Transaction.new(:item_id, :user_id)
    if @transaction.valid?
      pay_item
      @transaction.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  
  def set_item
    @item = Item.find(params[:id])
  end

  def transaction_params
    params.permit(:token).merge(item_id: @item.id, user_id: current_user.id)
  end

  def pay_item
    Pay.api_key = ""
    Payjp::Charge.create(
      amount: @item.price,
      card: transaction_params[:token],
      currency:'jpy'
    )
  end

end
