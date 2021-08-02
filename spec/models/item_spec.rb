require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品' do
    context '出品できるとき' do
      it 'name,profile,price,category_id,status_id,money_responsibility_id,
      outgoing_area_id,going_days_id,user_idが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      
    end

    context '出品できないとき' do
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'profileが空では出品できない' do
        @item.profile = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Profile can't be blank")
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'category_idが--では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'status_idが--では出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'money_responsibility_idが--では出品できない' do
        @item.money_responsibility_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Money responsibility can't be blank")
      end

      it 'outgoing_area_idが--では出品できない' do
        @item.outgoing_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Outgoing area can't be blank")
      end

      it 'going_days_idが--では出品できない' do
        @item.going_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Going days can't be blank")
      end

      it '販売価格が¥300より少ない時は出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '販売価格が¥9999999より少ない時は出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end


    end
  end



end