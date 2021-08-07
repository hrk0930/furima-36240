FactoryBot.define do
  factory :order_address do
    post_number         {"123-4567"}
    city                {"大阪"}
    address             {"港区"}
    telephone_number    {"08011111111"}
    outgoing_area_id    {2}
    price {3000}
    token               {"tok_abcdefghijk00000000000000000"}

  end

  #it "priceとtokenがあれば保存ができること" do
   # expect(@order).to be_valid
  #end
  #it "tokenが空では登録できないこと" do
   # @order.token = nil
   # @order.valid?
  #  expect(@order.errors.full_messages).to include("Token can't be blank")
  #end




end
