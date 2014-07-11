class IndexPage < PageObject
  set_url '/'

  section :top_bar, TopBar, '.top-bar'
end
