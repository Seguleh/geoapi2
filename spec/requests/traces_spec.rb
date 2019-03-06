require 'rails_helper'

RSpec.describe "Traces", type: :request do
  describe "GET /traces" do
    it "works! (now write some real specs)" do
      get traces_path
      expect(response).to have_http_status(200)
    end
  end
end
