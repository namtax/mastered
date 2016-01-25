Stache.configure do |c|
  c.use :mustache

  # Set it to true if template path should be included in
  # script's id tag as a underscored prefix. It can be
  # overwritten by an id param in `#template_include_tag`.
  c.include_path_in_id = false
end
