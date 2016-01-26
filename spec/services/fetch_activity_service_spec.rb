describe FetchActivityService do
  subject        { described_class }
  let(:john)     { User.create(name: 'john') }
  let(:dave)     { User.create(name: 'dave') }
  let(:james)    { User.create(name: 'james') }
  let(:relation) { john.relationships.first }
  let(:project)  { john.projects.first }
  let(:like)     { john.likes.first }

  before do
    FollowUserService.run(follower: dave, user: john)
    FollowUserService.run(follower: john, user: james)
    CreateProjectService.run(user: john, name: 'my project')
    LikeProjectService.run(user: john, project_id: project.id )
  end

  it { expect(subject.run(user: dave).result).to eq [like, project, relation] }
end