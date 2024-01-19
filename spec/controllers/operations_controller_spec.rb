RSpec.describe OperationsController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns @operations and renders the index template' do
      operation = create(:operation, category:, user:)
      get :index, params: { category_id: category.id }
      expect(assigns(:operations)).to eq([operation])
      expect(response).to render_template('index')
    end
  end

  describe 'GET #new' do
    it 'assigns a new operation to @operation' do
      get :new, params: { category_id: category.id }
      expect(assigns(:operation)).to be_a_new(Operation)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new operation and redirects' do
        expect do
          post :create, params: { category_id: category.id, operation: attributes_for(:operation) }
        end.to change(Operation, :count).by(1)
        expect(response).to redirect_to(category_operations_path(category))
      end
    end
  end
end
