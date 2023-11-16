require 'rails_helper'

RSpec.describe ScamsController, type: :controller do

  let(:user) { User.create!(email: 'user@example.com', password: 'password', is_admin: false) }
  let(:test_scam) { Scam.create!(title: 'Test title', description: 'Test description') }

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'responds successfully with an HTTP 200 status code' do
      get :show, id: test_scam.id
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get :show, id: test_scam.id
      expect(response).to render_template('show')
    end

    it 'loads the scam post into @scam' do
      get :show, id: test_scam.id
      expect(assigns(:scam)).to eq(test_scam)
    end
  end

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

  describe 'GET #edit' do

    it 'assigns the requested scam post to @scam' do
      scam = Scam.create!(title: "Test Title", category: "social media", zipcode: "12345", description: "Test Description", user_id: user.id)
      get :edit, id: scam.id
      expect(assigns(:scam)).to eq(scam)
    end

    it 'renders the edit template' do
      scam = Scam.create!(title: "Test Title", category: "social media", zipcode: "12345", description: "Test Description", user_id: user.id)
      get :edit, id: scam.id
      expect(response).to render_template('edit')
    end

    it 'does not allow the user to modify scam posts of others' do
      not_my_scam = Scam.create!(title: "Test Title", category: "social media", zipcode: "12345", description: "Test Description", user_id: 999)
      get :edit, id: not_my_scam.id
      expect(flash[:warning]).to eq('You are not authorized to perform this action.')
    end
  end

  describe "PUT #update" do

    context "with valid attributes" do
      it "updates the scam" do
        scam = Scam.create!(title: "Test Title", category: "social media", zipcode: "12345", description: "Test Description", user_id: user.id)
        put :update, id: scam.id, scam: { title: "New Title" }
        scam.reload
        expect(scam.title).to eq("New Title")
      end

      it "redirects to the scam's show page" do
        scam = Scam.create!(title: "Test Title", category: "social media", zipcode: "12345", description: "Test Description", user_id: user.id)
        put :update, id: scam.id, scam: { title: "New Title" }
        expect(response).to redirect_to scam_path(scam)
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the scam" do
      scam = Scam.create!(title: "Test Title", category: "social media", zipcode: "12345", description: "Test Description", user_id: user.id)
      expect {
        delete :destroy, id: scam.id
      }.to change(Scam, :count).by(-1)
    end

    it "redirects to the scam's home page" do
      scam = Scam.create!(title: "Test Title", category: "social media", zipcode: "12345", description: "Test Description", user_id: user.id)
      delete :destroy, id: scam.id
      expect(response).to redirect_to scams_path
    end
  end
end