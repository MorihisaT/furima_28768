require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it 'image,name,discript,category,status,delivery_fee,are,delivery_time,priceが存在していれば保存できること' do
      expect(@item).to be_valid
    end
    it 'imageが空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空では保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'discriptが空では保存できないこと' do
      @item.discript = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Discript can't be blank")
    end
    it 'categoryが空では保存できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'categoryが1では登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it 'statusが空では保存できないこと' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it 'delivery_feeが空では保存できないこと' do
      @item.delivery_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank", "Delivery fee is not a number")
    end
    it 'delivery_feeが1では登録できないこと' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
    end
    it 'areaが空では保存できないこと' do
      @item.area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end
    it 'areaが1では登録できないこと' do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 1")
    end
    it 'delivery_timeが空では保存できないこと' do
      @item.delivery_time_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery time can't be blank", "Delivery time is not a number")
    end
    it 'delivery_timeが1では登録できないこと' do
      @item.delivery_time_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery time must be other than 1")
    end
    it 'priceが空では保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが299では登録できないこと' do
      @item.price =299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it 'priceが10,000,000では登録できないこと' do
      @item.price =10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
  end
end
