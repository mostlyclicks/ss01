
FactoryGirl.define do
  factory :athlete, :class => Refinery::Athletes::Athlete do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

