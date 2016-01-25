describe User do
  subject       { User.create(username: 'molly') }
  let(:john)    { User.create(username: 'john') }
  let(:project) { Project.create(name: 'Take over the world') }

  describe '#followers' do
    before { subject.followers << john }
    it     { expect(subject.followers).to eq [john] }
  end

  describe '#following' do
    before { subject.following << john }
    it     { expect(subject.following).to eq [john] }
  end

  describe '#projects' do
    before { subject.projects << project }
    it     { expect(subject.projects).to eq [project] }
  end

  describe '#projects_liked' do
    before { subject.projects_liked << project }
    it     { expect(subject.projects_liked).to eq [project] }
  end
end