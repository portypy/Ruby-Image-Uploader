require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe "Posts", type: :request do

  Post.reindex

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get posts_url
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
    it "renders the index template" do
      get posts_path
      expect(response).to render_template("index")
    end
  end
  describe "GET #new" do
    context 'as a logged-in user' do
      login_user
      it "responds successfully with an HTTP 200 status code" do
        get new_post_path
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end
    end
    context 'as not logged-in ' do
      it 'raises an Pundit exception' do
        expect { get new_post_path }.to raise_error(Pundit::NotAuthorizedError)
      end
    end
  end
  # describe "POST #create" do
    # it 'returns a 302 response' do
    #   user = FactoryBot.create(:admin)
    #   # user.id = 1
    #   user.save!
    #   sign_in user
    #   post1 = FactoryBot.build(:post)
    #   post '/posts', params:{ :post =>  {:title => post1.title, :category_id => post1.category.id}}
    #   expect(response).to have_http_status(302)
    # end
    #
    # it "creates a new post" do
      # user = FactoryBot.create(:admin)
      # user = User.last
      # sign_in user
      #
      # post = FactoryBot.attributes_for(:post)
      #
      # post posts_path, params:{:post => post, :user_id => '1' }
      # expect(response).to be_successful
      # expect(response).to have_http_status(302)

      # expect { post :index, params:{post:post} }.to change(Post, :count).by(1)
    # end
  # end
  describe 'GET #show' do
    it 'responds successfully with an HTTP 200 status code' do
      @post = FactoryBot.create(:post)
      get post_path(@post)
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @post = FactoryBot.create(:post)
    end
    context 'as admin' do
      login_admin
      it 'deletes post, response with correct HTTP status, redirects and flash appropriate notice' do
        expect { delete post_path(@post) }.to change(Post, :count).by(-1)
        expect(response).to have_http_status(302)
        follow_redirect!
        expect(flash[:notice]).to match(/Post was successfully destroyed.*/)
      end
    end
    context 'as normal user' do
      login_user
      it 'raises an Pundit exception' do
        expect { delete post_path(@post) }.to raise_error(Pundit::NotAuthorizedError)
      end
    end
  end
end
