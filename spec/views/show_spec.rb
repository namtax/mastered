module Users
  describe Show do
    let(:dave)     { User.create(name: 'dave') }
    let(:john)     { User.create(name: 'john') }
    let(:james)    { User.create(name: 'james') }
    let(:project)  { john.projects.first }
    let(:activity) { FetchActivityService.run(user: dave).result }
    let(:activities) do
      [
        "john liked the project - my project",
        "john created the project - my project",
        "john started stalking/following james"
      ]
    end

    before do
      FollowUserService.run(follower: dave, user: john)
      FollowUserService.run(follower: john, user: james)
      CreateProjectService.run(user: john, name: 'my project')
      LikeProjectService.run(user: john, project_id: project.id )
    end

    describe '#activities' do
      before  { subject.instance_variable_set(:@activity, activity) }
      it      { expect(subject.activities).to eq activities }
    end
  end
end