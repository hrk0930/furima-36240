FactoryBot.define do
  factory :user do

    nick_name             { Faker::Name.name }
    email                 {Faker::Internet.free_email}
    last_name             {"山田"}
    last_name_kana        {"ヤマダ"}
    first_name            {"太郎"}
    first_name_kana       {"タロウ"}
    birth                 {"2000-01-01"}
    
  end
end