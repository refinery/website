
FactoryGirl.define do
  factory :extension, :class => Refinery::Extensions::Extension do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

