module Users
  class Show
    class RelationshipActivity
      def self.run(activity)
        "#{activity.follower.name} started stalking/following #{activity.following.name}"
      end
    end
  end
end