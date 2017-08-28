class JocoLibrariesApp::Libraries

  attr_accessor :name, :location, :phone, :url, :hours
  #@@scraped_libraries = []


  def self.current #pulls for this instance of the app call
    #scrape joco.libraries.gov for CURRENT list of libraries
    puts "Johnson County Public Libraries:"
    #create a nested array of instances for each Lib in Joco, each instance w/the same properties.
    self.scrape_libraries
  end

  def self.scrape_libraries
    libraries = []
    doc = Nokogiri::HTML(open("https://www.jocolibrary.org/locations"))

    doc.css(".location_name").each {|library|
      libraries << {
        :name => library.css("a").text,
        :location => doc.css(".location_address").css("p").text,
        :url => doc.css(".location_name a").attribute("href").value,
        :hours => doc.css(".regular_hours").css(".oh-display").text
        }
    }
    libraries
      #binding.pry
  end

  def get_phone
  end

  def self.list_libraries
  end


  def self.scrape_library_details
    #scrape location, phone, hours, url for selected library

  end


end
