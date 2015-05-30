
FactoryGirl.define do
  factory :contributor, :class => Refinery::Contributors::Contributor do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

