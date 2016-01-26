module Users
  class Show < ::Stache::Mustache::View
    def name
      @user.name.capitalize
    end

    def projects
      @user.projects.map(&:as_json)
    end

    def initial
      name[0]
    end
  end
end