module Layouts
  class Application < ::Stache::Mustache::View
    def flashes
      content_tag(:p, flash[:success], :class => "flash notice")
    end
  end
end