module Users
  class Index < ::Stache::Mustache::View
    def usernames
      @users.map(&:as_json)
    end

    def follow_path
      "users/%s/follow" % current_user.name
    end
  end
end
