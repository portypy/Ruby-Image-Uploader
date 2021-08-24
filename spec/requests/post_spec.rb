require 'rails_helper'
require 'sidekiq/testing'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :deletion

RSpec.describe "Posts", type: :request do

  DatabaseCleaner.clean
  login_admin
  Post.reindex

  describe "GET /index" do
    it "responds successfully with an HTTP 200 status code" do
      get posts_url
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
    it "renders the index template" do
      get posts_url
      expect(response).to render_template("index")
    end
  end
  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get new_post_url
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end
  describe "POST #create" do
    it "creates a new post" do

      post = FactoryBot.attributes_for(:post)
      expect { post posts_url, params: { :post => post } }.to change(Post, :count).by(1)
    end
  end
end
