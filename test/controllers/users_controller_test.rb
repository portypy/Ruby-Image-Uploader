require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Capybara::DSL

  def setup
    login_admin
  end

  test 'should assign mod role' do
    post assign_user_role_path(:id => @user.id, :role => 'mod')
    assert_equal(true, (@user.has_role? :mod))
  end

  test "should GET #index as an admin" do
    get users_index_url
    assert_response :success
  end

  test 'should not GET #index if not logged in' do
    sign_out @user
    assert_raises(Pundit::NotAuthorizedError) {
      get users_index_url}
  end

  test 'should not GET #index as a user' do
    post assign_user_role_path(:id => @user.id, :role => 'user')
    assert_raises(Pundit::NotAuthorizedError) {
      get users_index_url}
  end

  test 'should not GET #index as a mod' do
    post assign_user_role_path(:id => @user.id, :role => 'mod')
    assert_raises(Pundit::NotAuthorizedError) {
      get users_index_url}
  end

  test 'should GET #show as an admin' do
    get user_url(:id => @user.id)
    assert_response :success
  end

  test 'should not GET #show if not logged in' do
    sign_out @user
    assert_raises(Pundit::NotAuthorizedError) {
      get user_url(:id => @user.id)}
  end

  test 'should not GET #show as a user' do
    post assign_user_role_path(:id => @user.id, :role => 'user')
    assert_raises(Pundit::NotAuthorizedError) {
      get user_url(:id => @user.id)}
  end

  test 'should not GET #show as a mod' do
    post assign_user_role_path(:id => @user.id, :role => 'mod')
    assert_raises(Pundit::NotAuthorizedError) {
      get user_url(:id => @user.id)}
  end

end
