require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  describe '#create' do
    before do
      @address_order = FactoryBot.build(:address_order)
    end

    it "postal_code,area_id,city,house_number,building_name,phone_numberが存在すれば登録できること" do
      expect(@address_order).to be_valid
    end
    it "building_nameが空でも登録できること" do
      @address_order.building_name = nil
      expect(@address_order).to be_valid
    end
    it "postal_codeが空では登録できないこと" do
      @address_order.postal_code = nil
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Postal code can't be blank", "Postal code indlude hyphen(-)")
    end
    it "postal_codeにハイフン(-)が無ければ登録できないこと" do
      @address_order.postal_code = "4910001"
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Postal code indlude hyphen(-)")
    end
    it "area_idが空では登録できないこと" do
      @address_order.area_id = nil
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Area can't be blank", "Area is not a number")
    end
    it "area_idが1では登録できないこと" do
      @address_order.area_id = 1
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Area must be other than 1")
    end
    it "cityが空では登録できないとこ" do
      @address_order.city = nil
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("City can't be blank")
    end
    it "house_numberが空では登録できないこと" do
      @address_order.house_number = nil
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("House number can't be blank")
    end
    it "phone_numberが空では登録できないこと" do
      @address_order.phone_number = nil
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Phone number can't be blank", "Phone number is not include hyphen(-)")
    end
    it "phone_numberにハイフン(-)があると登録できないこと" do
      @address_order.phone_number = "090-1234-5679"
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Phone number is not include hyphen(-)", "Phone number is too long (maximum is 11 characters)")
    end
    it "phone_numberが12桁の時登録できないこと" do
      @address_order.phone_number = "123412341234"
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
  end
end
