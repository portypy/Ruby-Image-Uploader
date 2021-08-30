require 'faker'

FactoryBot.define do
  factory :subcategory do
    name { Faker::Name.unique.name }
    # categories { [Category.create(:name => 'name')] }
    category_ids { [1]
    }
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
    title {Faker::Name.unique.name}
     association :category, factory: :category
     association :user, factory: :user
  end
end