require 'test_helper'


class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = User.new
  end

  test 'should has an id' do
    @user.save
    assert_equal(1, @user.id)
  end

  test 'should assign default role' do
    @user.assign_default_role
    assert_equal(true, (@user.has_role? :user))
  end


end
