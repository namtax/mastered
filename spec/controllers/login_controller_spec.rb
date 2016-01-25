RSpec.describe LoginController, type: :controller do
  describe 'POST login' do
    let!(:john)    { User.create(name: name, password: password) }
    let(:name)     { 'john' }
    let(:password) { 'letmein' }
    let(:service)  { double(valid?: true, result: john.id) }
    let(:opts)     { { username: 'john', password: 'letmein', session: anything } }

    context 'valid credentials' do
      before do
        allow(LoginUserService).to receive(:run).with(opts).and_return(service)
        session[:user_id] = john.id
      end

      it 'redirects to users path' do
        post :create, { username: 'john', password: 'letmein' }
        expect(response).to redirect_to('/users/john')
      end
    end

    context 'invalid credentials' do
      it 'notifies user' do
        post :create, { name: 'john', password: '' }
        expect(flash[:warning]).to eq 'Please supply valid login credentials'
      end

      it 'renders form so user can try again' do
        post :create, { name: 'john', password: '' }
        expect(response).to render_template(:new)
      end
    end
  end
end
