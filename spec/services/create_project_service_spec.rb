describe CreateProjectService do
  subject { described_class }

  describe '.run' do
    let(:john) { User.create(name: 'john') }

    it 'creates project for user' do
      subject.run(user: john, name: 'takeover')
      expect(john.projects.first.name).to eq 'takeover'
    end

    context 'name missing' do
      let(:errors) { Hash[:name, ["can't be blank"]] }

      it 'notifies user' do
        expect(subject.run(user: john, name: '').errors.messages).to eq errors
      end
    end
  end
end