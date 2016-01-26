module Users
  class Show < ::Stache::Mustache::View

    PRESENTER_MAP = {
      like: LikeActivity,
      project: ProjectActivity,
      relationship: RelationshipActivity
    }

    def name
      @user.name.capitalize
    end

    def activities
      @activity.map do |a|
        PRESENTER_MAP[a.class.name.downcase.to_sym].run(a)
      end
    end

    def projects
      @user.projects.map(&:as_json)
    end

    def initial
      name[0]
    end
  end
end