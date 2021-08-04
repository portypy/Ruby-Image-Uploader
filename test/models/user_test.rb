require 'test_helper'


class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  test 'should assign admin role' do
    @user = User.new
    @user.assign_user_role('admin')
    assert_equal(true, @user.is_admin)
  end

end
