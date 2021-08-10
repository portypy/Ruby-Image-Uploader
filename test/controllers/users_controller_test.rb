require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Capybara::DSL

  def setup
    @user = User.new( email: 'example@example.com', password: '111111')
    @user.save
  end

  test 'should assign admin role' do
    post assign_user_role_path(:id => @user.id, :role => 'admin')
    assert_equal(true, (@user.has_role? :admin))
  end

  test "should GET #index as an admin" do
    post assign_user_role_path(:id => @user.id, :role => 'admin')
    sign_in @user
    get users_index_url
    assert_response :success
  end

  test 'should not GET #index if not logged in' do
    assert_raises(Pundit::NotAuthorizedError) {
      get users_index_url}
  end

  test 'should not GET #index as a user' do
    sign_in @user
    assert_raises(Pundit::NotAuthorizedError) {
      get users_index_url}
  end

  test 'should not GET #index as a mod' do
    post assign_user_role_path(:id => @user.id, :role => 'mod')
    sign_in @user
    assert_raises(Pundit::NotAuthorizedError) {
      get users_index_url}
  end
end
