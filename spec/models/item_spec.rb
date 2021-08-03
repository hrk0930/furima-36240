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

      it 'category_idの値が1では保存できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'status_idの値が1では保存できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'money_responsibility_idの値が1では保存できない' do
        @item.money_responsibility_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Money responsibility can't be blank")
      end

      it 'outgoing_area_idの値が1では保存できない' do
        @item.outgoing_area_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Outgoing area can't be blank")
      end

      it 'going_days_idの値が1では保存できない' do
        @item.going_days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Going days can't be blank")
      end

      it '商品名が40字より多い時は出品できない' do
        @item.name = 'あ' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      
      it '商品の説明が1,000字より多い時は出品できない' do
        @item.profile = 'あ' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Profile is too long (maximum is 1000 characters)")
      end

      it '販売価格が¥300より少ない時は出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '販売価格が¥9999999より多い時は出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceが全角文字では登録できない' do
        @item.price = '９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが半角英数混合では登録できない' do
        @item.price = '1111a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが半角英語では登録できない' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end



    end
  end



end