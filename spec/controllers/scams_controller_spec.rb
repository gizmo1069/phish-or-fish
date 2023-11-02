require 'rails_helper'

RSpec.describe ScamsController, type: :controller do


  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new scam" do
        expect {
          post :create, scam: { title: "Test Title", category: "social media", zipcode: "12345", description: "Test Description" }
        }.to change(Scam, :count).by(1)
      end

      it "redirects to the scam's home page" do
        post :create, scam: { title: "Test Title", category: "social media", zipcode: "12345", description: "Test Description" }
        expect(response).to redirect_to scams_path
      end
    end
  end

  describe "PUT #update" do
    let(:scam) { Scam.create(title: "Test Title", category: "social media", zipcode: "12345", description: "Test Description") }

    context "with valid attributes" do
      it "updates the scam" do
        put :update, id: scam.id, scam: { title: "New Title" }
        scam.reload
        expect(scam.title).to eq("New Title")
      end

      it "redirects to the scam's show page" do
        put :update, id: scam.id, scam: { title: "New Title" }
        expect(response).to redirect_to scam_path(scam)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:scam) { Scam.create(title: "Test Title", category: "social media", zipcode: "12345", description: "Test Description") }

    it "deletes the scam" do
      expect {
        delete :destroy, id: scam.id
      }.to change(Scam, :count).by(-1)
    end

    it "redirects to the scam's home page" do
      delete :destroy, id: scam.id
      expect(response).to redirect_to scams_path
    end
  end
end