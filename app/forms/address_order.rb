class AddressOrder

  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "indlude hyphen(-)"}
    validates :area_id, numericality: { other_than: 1 }
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: "is not include hyphen(-)" }, length: { maximum: 11}
  end
    validates :city, :house_number, presence: true
    
  def save
    order = Order.create(item_id: params[:item_id], user_id: current_user.id)
    Address.create(postal_code: params[postal_code], area_id: params[area_id], city: params[:city], house_number: params[:house_number], building_name: params[:building_name], phone_number: params[:phone_number], order_id: order.id)
  end
end
