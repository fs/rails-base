class IndexPage < SitePrism::Page
  set_url '/'

  section :top_bar, TopBar, '.top-bar'
end
