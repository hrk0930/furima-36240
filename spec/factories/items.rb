FactoryBot.define do
  factory :item do

    name                     {"漫画"}
    profile                  {"本"}
    price                    {1000}
    category_id              {2}
    status_id                {2}
    money_responsibility_id  {2}
    outgoing_area_id         {2}
    going_days_id            {2}
    user_id                  {1}
    
    association :user 
  end
end