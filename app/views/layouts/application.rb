module Layouts
  class Application < ::Stache::Mustache::View
    def flashes
      flash.map do |f|
        content_tag(:p, f.last, :class => f.first)
      end.join
    end

    def username
      User.find(session[:user_id]).name
    end

    def user_path
      "/users/#{username}"
    end
  end
end