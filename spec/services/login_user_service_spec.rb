describe LoginUserService do
  subject       { described_class }
  let!(:user)   { User.create(name: name, password: pass) }
  let(:name)    { 'name'}
  let(:pass)    { 'password' }
  let(:params)  { { username: name, password: pass, session: session} }
  let(:session) { ActionDispatch::Request::Session.create(store, {}, {}) }
  let(:store)   { double(load_session: [nil, {}]) }

  before { session.send(:load!) }

  describe '.run' do
    context 'valid credentials' do
      it { expect(subject.run(params).result).to eq user.id }
    end

    context 'invalid credentials' do
      let(:params) { { username: name, password: 'xx', session: session } }
      it { expect(subject.run(params).result).to be_nil }
    end
  end

  after { session.clear }
end