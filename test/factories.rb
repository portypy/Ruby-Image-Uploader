require 'faker'

FactoryBot.define do
  factory :user do
      email { Faker::Internet.email }
      password { "MyString" }

      trait :admin do
        after(:create) {|user| user.add_role(:admin)}
      end

      factory :admin, traits:[:admin]
    end
  end