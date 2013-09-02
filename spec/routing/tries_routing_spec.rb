require "spec_helper"

describe TriesController do
  describe "routing" do

    it "routes to #index" do
      get("/tries").should route_to("tries#index")
    end

    it "routes to #new" do
      get("/tries/new").should route_to("tries#new")
    end

    it "routes to #show" do
      get("/tries/1").should route_to("tries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tries/1/edit").should route_to("tries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tries").should route_to("tries#create")
    end

    it "routes to #update" do
      put("/tries/1").should route_to("tries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tries/1").should route_to("tries#destroy", :id => "1")
    end

  end
end
