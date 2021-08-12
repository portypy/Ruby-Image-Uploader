require 'test_helper'


class UserTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers

  # test "the truth" do
  #   assert true
  # end
  setup do
    login_admin
  end

  test 'should assign default role' do
    @user.assign_default_role
    assert_equal(true, (@user.has_role? :user))
  end

end
