require "rails_helper"

RSpec.describe InstaItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/insta_items").to route_to("insta_items#index")
    end

    it "routes to #new" do
      expect(get: "/insta_items/new").to route_to("insta_items#new")
    end

    it "routes to #show" do
      expect(get: "/insta_items/1").to route_to("insta_items#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/insta_items/1/edit").to route_to("insta_items#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/insta_items").to route_to("insta_items#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/insta_items/1").to route_to("insta_items#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/insta_items/1").to route_to("insta_items#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/insta_items/1").to route_to("insta_items#destroy", id: "1")
    end
  end
end
