describe User do
  subject     { User.create(username: 'molly') }
  let(:john)  { User.create(username: 'john') }

  describe '#followers' do
    before { subject.followers << john }
    it     { expect(subject.followers).to eq [john] }
  end

  describe '#following' do
    before { subject.following << john }
    it     { expect(subject.following).to eq [john] }
  end
end