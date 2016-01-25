RSpec.describe UsersController, type: :controller do
  describe 'POST follow' do
    let!(:nina)   { User.create(name: 'nina') }
    let!(:john)   { User.create(name: 'john') }
    let(:service) { double(valid?: true) }

    it 'delegates to service' do
      expect(FollowUserService).to receive(:run).with(user: nina, follower: john).and_return(service)
      post :follow, { id: 'john', user_id: nina.id }
    end

    it 'redirects to users path' do
      post :follow, { id: 'john', user_id: nina.id }
      expect(response).to redirect_to(users_path)
    end

    it 'redirects to users path' do
      post :follow, { id: 'john', user_id: nina.id }
      expect(flash[:success]).to eq 'You are now following nina'
    end
  end
end
