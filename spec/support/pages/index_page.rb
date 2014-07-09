class IndexPage < PageObject
  set_url root_path

  section :top_bar, TopBar, '.top-bar'
end
