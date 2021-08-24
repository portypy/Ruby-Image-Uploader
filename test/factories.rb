require 'faker'

FactoryBot.define do
  factory :subcategory do
    name { Faker::Name.unique.name }
    # categories { [Category.create(:name => 'naaaaame')] }
    categories { [FactoryBot.build(:category)] }
  end

  factory :category do
    name { Faker::Name.unique.name }
  end

  factory :user do
      email { Faker::Internet.email }
      password { "MyString" }

      trait :admin do
        after(:create) {|user| user.add_role(:admin)}
      end

      factory :admin, traits:[:admin]
  end

  factory :post do
    association :category
    association :user
    title {Faker::Name.unique.name}
    category_id { Faker::Number.between(from: 1, to: 10) }
    user_id { Faker::Number.between(from: 1, to: 10) }

  end
end