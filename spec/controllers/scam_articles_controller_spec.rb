require 'rails_helper'

RSpec.describe ScamArticlesController, type: :controller do
  let(:admin) { User.create!(email: 'admin@example.com', password: 'password', is_admin: true) }
  let(:user) { User.create!(email: 'user@example.com', password: 'password', is_admin: false) }
  let(:scam_article) { ScamArticle.create!(title: 'Test Article', body: 'Test Body', author: 'Test Author') }

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

    it 'loads all of the scam articles into @scam_articles' do
      get :index
      expect(assigns(:scam_articles)).to match_array([scam_article])
    end
  end

  describe 'GET #show' do
    it 'responds successfully with an HTTP 200 status code' do
      get :show, id: scam_article.id
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get :show, id: scam_article.id
      expect(response).to render_template('show')
    end

    it 'loads the scam article into @scam_article' do
      get :show, id: scam_article.id
      expect(assigns(:scam_article)).to eq(scam_article)
    end
  end

  describe 'GET #new' do
    context 'as an admin user' do
      before do
        allow(controller).to receive(:current_user).and_return(admin)
      end

      it 'responds successfully with an HTTP 200 status code' do
        get :new
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end

      it 'renders the new template' do
        get :new
        expect(response).to render_template('new')
      end
    end

    context 'as a non-admin user' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'redirects to the scam articles index' do
        get :new
        expect(response).to redirect_to(scam_articles_path)
      end
    end
  end

  describe 'POST #create' do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in admin
    end

    context 'with valid attributes' do
      it 'creates a new scam article' do
        expect {
          post :create, scam_article: { title: 'New Article', body: 'New Body' }
        }.to change(ScamArticle, :count).by(1)
      end

      it 'redirects to the new scam article' do
        post :create, scam_article: { title: 'New Article', body: 'New Body' }
        expect(response).to redirect_to(ScamArticle.last)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new scam article' do
        expect {
          post :create, scam_article: { title: '', body: '' }
        }.to_not change(ScamArticle, :count)
      end

      it 're-renders the new method' do
        post :create, scam_article: { title: '', body: '' }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'GET #edit' do
    before do
        allow(controller).to receive(:current_user).and_return(admin)
    end

    it 'assigns the requested scam article to @scam_article' do
      get :edit, id: scam_article.id
      expect(assigns(:scam_article)).to eq(scam_article)
    end

    it 'renders the edit template' do
      get :edit, id: scam_article.id
      expect(response).to render_template('edit')
    end
  end

  describe 'PATCH #update' do
    before do
        allow(controller).to receive(:current_user).and_return(admin)
    end

    context 'with valid attributes' do
      it 'updates the requested scam article' do
        test_article = ScamArticle.create!(title: 'Test Article', body: 'Test Body', author: 'Test Author')
        patch :update, id: test_article.id, scam_article: { title: 'Updated Title' }
        test_article.reload
        expect(test_article.title).to eq('Updated Title')
      end

      it 'redirects to the updated scam article' do
        test_article = ScamArticle.create!(title: 'Test Article', body: 'Test Body', author: 'Test Author')
        patch :update, id: test_article.id, scam_article: { title: 'Updated Title' }
        expect(response).to redirect_to(test_article)
      end
    end

    context 'with invalid attributes' do
      it 'does not change the scam article\'s attributes' do
        test_article = ScamArticle.create!(title: 'Test Article', body: 'Test Body', author: 'Test Author')
        expect {
          patch :update, id: test_article.id, scam_article: { title: '' }
          test_article.reload
        }.to_not change(test_article, :title)
      end

      it 're-renders the edit template' do
        test_article = ScamArticle.create!(title: 'Test Article', body: 'Test Body', author: 'Test Author')
        patch :update, id: test_article.id, scam_article: { title: '' }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
        allow(controller).to receive(:current_user).and_return(admin)
    end

    it 'deletes the scam article' do
      test_article = ScamArticle.create!(title: 'Test Article', body: 'Test Body', author: 'Test Author')
      expect {
        delete :destroy, id: test_article.id
      }.to change(ScamArticle, :count).by(-1)
    end

    it 'redirects to scam_articles#index' do
      test_article = ScamArticle.create!(title: 'Test Article', body: 'Test Body', author: 'Test Author')
      delete :destroy, id: test_article.id
      expect(response).to redirect_to(scam_articles_path)
    end
  end

end