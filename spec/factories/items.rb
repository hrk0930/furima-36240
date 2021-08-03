FactoryBot.define do
  factory :item do

    name                     {Faker::Name.name}
    profile                  {"本"}
    price                    {Faker::Number.between(from: 300, to: 9_999_999)}
    category_id              {2}
    status_id                {2}
    money_responsibility_id  {2}
    outgoing_area_id         {2}
    going_days_id            {2}
   
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end