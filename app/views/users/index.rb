module Users
  class Index < ::Stache::Mustache::View
    def usernames
      @users.map(&:as_json)
    end
  end
end
