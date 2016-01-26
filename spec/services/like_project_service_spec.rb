describe LikeProjectService do
  subject       { described_class }
  let(:project) { Project.create(name: 'lift off') }
  let(:john)    { User.create(name: 'John') }

  describe '#run' do
    it do
      subject.run(user: john, project: project)
      expect(john.projects_liked).to eq [project]
    end
  end
end