require 'test_helper'

class SubcategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subcategory_index_url
    assert_response :success
  end

  test "should get new" do
    get subcategory_new_url
    assert_response :success
  end

end
