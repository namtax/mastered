module Users
  class Show
    class ProjectActivity
      def self.run(activity)
        "#{activity.user.name} created the project - #{activity.name}"
      end
    end
  end
end