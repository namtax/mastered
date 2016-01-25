describe FollowUserService do
  subject { described_class }

  describe '.run' do
    let(:nina) { User.create(name: 'nina') }
    let(:john) { User.create(name: 'john') }

    it 'sets up relationship' do
      subject.run(user: nina, follower: john)
      expect(john.following.to_a).to eq [nina]
    end
  end
end