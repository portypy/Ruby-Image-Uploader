require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    login_admin
    Post.reindex
    @post = FactoryBot.create(:post)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "Posts"
  end

  test "creating a Post" do
    visit posts_url
    click_on "New Post"

    attach_file('Image','test/fixtures/files/Screenshot_2021-05-21_at_15.59.50.png')
    fill_in "Title", with: @post.title
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "updating a Post" do
    visit posts_url
    click_on "Edit", match: :prefer_exact

    attach_file('Image','test/fixtures/files/Screenshot_2021-05-21_at_15.59.50.png')

    # fill_in "Title", with: @post.title
    # fill_in "Categories", with: @post.category
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "destroying a Post" do
    visit posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post was successfully destroyed"
  end
end
