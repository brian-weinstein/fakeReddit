require "rails_helper"

RSpec.describe SubsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/subs").to route_to("subs#index")
    end

    it "routes to #new" do
      expect(get: "/subs/new").to route_to("subs#new")
    end

    it "routes to #show" do
      expect(get: "/subs/1").to route_to("subs#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/subs/1/edit").to route_to("subs#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/subs").to route_to("subs#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/subs/1").to route_to("subs#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/subs/1").to route_to("subs#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/subs/1").to route_to("subs#destroy", id: "1")
    end
  end
end
