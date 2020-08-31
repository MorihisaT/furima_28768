class AddressOrder

  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "indlude hyphen(-)"}
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: "is not include hyphen(-)" }, length: { maximum: 11}
  end
    validates :city, :house_number, presence: true
    
  def save
    order = Transaction.create(item_id: params[item_id], user_id: current_user.id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, transaction: order.id)
  end
end
