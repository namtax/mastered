module Users
  class Show
    class LikeActivity
      def self.run(activity)
        "#{activity.user.name} liked the project - #{activity.project.name}"
      end
    end
  end
end