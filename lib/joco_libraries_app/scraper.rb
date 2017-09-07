class JocoLibrariesApp::Scraper

  def get_page
    doc = Nokogiri::HTML(open("https://www.jocolibrary.org/locations"))
  end

  def scrape_libraries_index
    self.get_page.css(".location-branch")
  end

  def make_libraries
    scrape_libraries_index.each {|x|
      JocoLibrariesApp::Libraries.new_from_index_page(x)
    }
  end

end
