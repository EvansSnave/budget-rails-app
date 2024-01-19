# spec/controllers/categories_controller_spec.rb
require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user) }
  let(:category_params) { { category: { name: 'New Category', icon: 'icon_url' } } }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns @categories' do
      category = create(:category, user:)
      get :index
      expect(assigns(:categories)).to eq([category])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new category' do
        expect do
          post :create, params: category_params
        end.to change(Category, :count).by(1)
      end

      it 'redirects to the categories index with a notice' do
        post :create, params: category_params
        expect(response).to redirect_to(categories_path)
        expect(flash[:notice]).to eq('Category created successfully.')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new category' do
        expect do
          post :create, params: { category: { name: '', icon: '' } }
        end.to_not change(Category, :count)
      end

      it 're-renders the new template' do
        post :create, params: { category: { name: '', icon: '' } }
        expect(response).to render_template('new')
      end
    end
  end
end
