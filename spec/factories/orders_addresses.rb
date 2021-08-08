FactoryBot.define do
  factory :order_address do
    post_number         {"123-4567"}
    city                {"大阪"}
    address             {"港区"}
    building            {"ライオンズビル"}
    telephone_number    {"08011111111"}
    outgoing_area_id    {2}
    token               {"tok_abcdefghijk00000000000000000"}

  end

end
