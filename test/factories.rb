require 'faker'

FactoryBot.define do
  factory :subcategory do
    
  end

  factory :category do
    
  end

  factory :user do
      email { Faker::Internet.email }
      password { "MyString" }

      trait :admin do
        after(:create) {|user| user.add_role(:admin)}
      end

      factory :admin, traits:[:admin]
    end
  end