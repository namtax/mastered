module Projects
  class Show < ::Stache::Mustache::View
    def name
      @project.name.capitalize
    end

    def info
      "Created by #{@project.user.name} on #{created_at}"
    end

    private

    def created_at
      @project.created_at.strftime("%d %b %Y at %I:%M")
    end
  end
end