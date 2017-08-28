class JocoLibrariesApp::Libraries

  attr_accessor :name, :location, :phone, :url, :hours


  def self.current #pulls for this instance of the app call
    #scrape joco.libraries.gov for CURRENT list of libraries
    puts "Johnson County Public Libraries:"
    #create a nested array of instances for each Lib in Joco, each instance w/the same properties.
    self.scrape_libraries
  end

  def self.scrape_libraries
    scraped_libraries = []
    doc = Nokogiri::HTML(open("https://www.jocolibrary.org/locations"))

    doc.css(".location_name").each {|library|
      scraped_libraries << {
        :name => library.css("a").text
        }
    }
    scraped_libraries
      binding.pry
  end

  def self.list_libraries
  end


  def self.scrape_library_details
    #scrape location, phone, hours, url for selected library

  end


end
