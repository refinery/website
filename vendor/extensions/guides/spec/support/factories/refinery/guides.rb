
FactoryGirl.define do
  factory :guide, :class => Refinery::Guides::Guide do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

