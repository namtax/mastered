module Layouts
  class Application < ::Stache::Mustache::View
    def notices
      flashes.present?
    end

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

    def logged_in
      session[:user_id]
    end

    def logged_out
      !logged_in
    end
  end
end