
FactoryGirl.define do
  factory :banner, :class => Refinery::Banners::Banner do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

