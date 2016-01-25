module Layouts
  class Application < ::Stache::Mustache::View
    def flashes
      flash.map do |f|
        content_tag(:p, f.last, :class => f.first)
      end.join
    end
  end
end