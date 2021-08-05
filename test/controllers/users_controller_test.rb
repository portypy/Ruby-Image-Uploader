require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Capybara::DSL


  test "should get index" do
    get users_index_url
    assert_response :success
  end

  test 'should assign admin role' do
    @user = User.new( email: 'example@example.com', password: '111111')
    @user.save

    post assign_user_role_path(:id => @user.id, :role => 'admin')
    assert_equal(true, (@user.has_role? :admin))

  end
end
