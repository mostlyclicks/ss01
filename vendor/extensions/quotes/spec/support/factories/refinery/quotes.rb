
FactoryGirl.define do
  factory :quote, :class => Refinery::Quotes::Quote do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

