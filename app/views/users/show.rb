module Users
  class Show < ::Stache::Mustache::View
    def name
      @user.name
    end
  end
end