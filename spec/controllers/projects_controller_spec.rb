RSpec.describe ProjectsController, type: :controller do
  describe 'POST create' do
    let!(:john)    { User.create(name: name, password: password) }
    let(:name)     { 'john' }
    let(:password) { 'letmein' }

    before { session[:user_id] = john.id }

    context 'valid input' do
      it 'redirects to users home page' do
        post :create, { name: 'take over the world' }
        expect(response).to redirect_to('/users/john')
      end
    end

    context 'invalid input' do
      let(:params ) { { name: ' ' } }

      it 'notifies user' do
        post :create, params
        expect(flash[:warning]).to eq "Name can't be blank"
      end

      it 'renders form so user can try again' do
        post :create, params
        expect(response).to render_template(:new)
      end
    end
  end
end
