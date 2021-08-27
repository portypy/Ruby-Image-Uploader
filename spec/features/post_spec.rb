require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe "Posts", type: :feature do

  user = FactoryBot.create(:admin)
  post = FactoryBot.create(:post)
  Post.reindex

  before(:each) do
    visit 'sign_in'
    expect(page).to  have_content('Log in')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    check 'Remember me'
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  it 'visiting the index' do
    visit posts_path
    expect(page).to have_content('Posts')
  end

  it 'should visit #show' do
    visit post_path(post)
    expect(page).to have_content(post.title)
  end

  it 'should visit #show and add comment' do
    visit post_path(post)
    fill_in 'comment_commenter', with: 'Random Name'
    fill_in 'comment_body', with: 'Strange Comment'
    click_button 'Create Comment'
    expect(page).to have_content('Your comment was posted!')
    expect(page).to have_content('Random Name')
    expect(page).to have_content('Strange Comment')
  end

  context 'there are category & subcategory to be selected' do
    FactoryBot.create(:category)
    FactoryBot.create(:subcategory)
    Capybara.current_driver = :selenium_chrome

    it 'should create new post' do
      visit posts_path
      click_on 'New Post'
      expect(page).to have_content('New Post')
      fill_in 'Title', with: 'Random Title'
      find('#post_category_id option:first-of-type').select_option
      find('#post_subcategory_ids option:first-of-type').select_option
      attach_file('post_image', 'spec/files/Screenshot_2021-05-21_at_15.59.50.png')
      sleep(100)
      click_on 'Create Post'
      expect(page).to have_content('Post was successfully created.')
      expect(page).to have_content('Random Title')
      expect(page).to have_content(Category.all[0].name)
      expect(page).to have_content(Subcategory.all[0].name)
      page { is_expected.to have_css('img') }
      page { is_expected.to have_xpath('/html/body/div[1]/div/div[2]/p[4]/img') }
    end
  end
  context 'there is no category to select from' do
    before(:all) do
      Capybara.current_driver = :selenium_chrome
    end
    it 'should create new post' do
      # Comment.delete_all
      # Post.delete_all
      # Category.delete_all
      visit posts_path
      click_on 'New Post'
      expect(page).to have_content('New Post')
      fill_in 'Title', with: 'Random Title'
      page.save_and_open_page
      # fill_in'post_category_id', with: 'Cat_name'
      # find('post_category_id').native.send_keys('Cat_name')
      x = find(:css, '#post_category_id')
      x.native.clear
      # find(:css, '#post_category_id').set('Cat_name')
      find(:xpath, '/html/body/div[1]/div/div[2]/form/div[3]/div/div[1]/input').set('Sub_name')
      # find(:xpath, "/html/body/div[1]/div/div[2]/form/div[3]/div/div[2]/div/div/text()[1]").click
      attach_file('post_image', 'spec/files/Screenshot_2021-05-21_at_15.59.50.png')
      click_on 'Create Post'
      expect(page).to have_content('Post was successfully created.')
      expect(page).to have_content('Random Title')
      expect(page).to have_content('Cat_name')
      # expect(page).to have_content('Sub_name')
      page { is_expected.to have_css('img') }
      page { is_expected.to have_xpath('/html/body/div[1]/div/div[2]/p[4]/img') }
    end
    # after(:all) do
    #   Capybara.use_default_driver
    # end
  end




end
