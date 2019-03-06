require 'rails_helper'

RSpec.describe TracesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Trace. As you add validations to Trace, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TracesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      trace = Trace.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      trace = Trace.create! valid_attributes
      get :show, params: {id: trace.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Trace" do
        expect {
          post :create, params: {trace: valid_attributes}, session: valid_session
        }.to change(Trace, :count).by(1)
      end

      it "renders a JSON response with the new trace" do

        post :create, params: {trace: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(trace_url(Trace.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new trace" do

        post :create, params: {trace: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested trace" do
        trace = Trace.create! valid_attributes
        put :update, params: {id: trace.to_param, trace: new_attributes}, session: valid_session
        trace.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the trace" do
        trace = Trace.create! valid_attributes

        put :update, params: {id: trace.to_param, trace: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the trace" do
        trace = Trace.create! valid_attributes

        put :update, params: {id: trace.to_param, trace: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested trace" do
      trace = Trace.create! valid_attributes
      expect {
        delete :destroy, params: {id: trace.to_param}, session: valid_session
      }.to change(Trace, :count).by(-1)
    end
  end

end
