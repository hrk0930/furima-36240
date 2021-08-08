require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '購入' do
    context '購入できるとき' do
      it 'post_number,city,address,building,telephone_number,
          outgoing_area_id,user_id,item_idが存在すれば配達できる' do
        expect(@address).to be_valid
      end
      it 'buildingは空でも購入できる' do
        @address.building = nil
        expect(@address).to be_valid
      end
    end

      context '購入できないとき' do
      it 'ユーザー情報がない場合は購入できないこと' do
        @address.user_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("User can't be blank")
      end

      it 'item情報がない場合は購入できないこと' do
        @address.item_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Item can't be blank")
      end

      it 'post_numberが空では購入できない' do
        @address.post_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Post number can't be blank")
      end

      it'post_numberが7桁以外では購入できない' do
        @address.post_number = '123-123'
        @address.valid?
        expect(@address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end

      it'post_numberはハイフンがなければ購入できない' do
        @address.post_number = '1234123'
        @address.valid?
        expect(@address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end

      it 'cityが空では購入できない' do
        @address.city = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では購入できない' do
        @address.address = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Address can't be blank")
      end
      
      it'outgoing_area_idが--では購入できない' do
        @address.outgoing_area_id = 0
        @address.valid?
        expect(@address.errors.full_messages).to include("Outgoing area can't be blank")
      end

      it'telephone_numberが10~11桁以外では購入できない' do
        @address.telephone_number = '123456789'
        @address.valid?
        expect(@address.errors.full_messages).to include("Telephone number is invalid")
      end

      it 'telephone_numberが全角数値では購入できない' do
        @address.telephone_number = '１２３４５67890'
        @address.valid?
        expect(@address.errors.full_messages).to include("Telephone number is invalid")
      end

      it "tokenが空では登録できないこと" do
          @address.token = nil
          @address.valid?
      expect(@address.errors.full_messages).to include("Token can't be blank")
      end
    end








  end

end
