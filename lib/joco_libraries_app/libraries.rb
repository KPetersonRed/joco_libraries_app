class JocoLibrariesApp::Libraries

  attr_accessor :name, :location, :phone, :url, :hours
  #@@scraped_libraries = []


  def self.current #pulls for this instance of the app call
    #scrape joco.libraries.gov for CURRENT list of libraries
    #create a nested array of instances for each Lib in Joco, each instance w/the same properties.
    puts "Johnson County Public Libraries:"
    self.get_libraries_list
  end


  def self.get_libraries_list
    libraries = []
    doc = Nokogiri::HTML(open("https://www.jocolibrary.org/locations"))
    doc.css(".location_name").each {|library|
      library.name = library.css("a").text
      libraries << library.name
      }

      doc.css(".location_address").each {|location|
        library.location =  << :location => location.css("p").text
      }
      binding.pry
    end


  def get_phone

  end

end
