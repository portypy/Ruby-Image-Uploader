require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  # @category = FactoryBot.create(:category)
  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

end
