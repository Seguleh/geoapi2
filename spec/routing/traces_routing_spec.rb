require "rails_helper"

RSpec.describe TracesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/traces").to route_to("traces#index")
    end

    it "routes to #show" do
      expect(:get => "/traces/1").to route_to("traces#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/traces").to route_to("traces#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/traces/1").to route_to("traces#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/traces/1").to route_to("traces#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/traces/1").to route_to("traces#destroy", :id => "1")
    end
  end
end
