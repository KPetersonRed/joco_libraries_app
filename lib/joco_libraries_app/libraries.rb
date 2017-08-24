class JocoLibrariesApp::Libraries

  attr_accessor :name, :location, :phone, :url, :hours


  def self.current #pulls for this instance of the app call
    #scrape joco.libraries.gov for CURRENT list of libraries
    puts "Johnson County Public Libraries:"
    #create a nested array of instances for each Lib in Joco, each instance w/the same properties.

    #joco_lib = [
      #Antioch = [location, phone, url, hours],
      #Blue Valley = [location, phone, url, hours]] etc

  #  joco_lib = []

    lib_1 = self.new
    lib_1.name = "Antioch"
    lib_2 = self.new
    lib_2.name = "Blue Valley"
    lib_3 = self.new
    lib_3.name = "Cedar Roe"
    lib_4 = self.new
    lib_4.name = "Central Resource"

  end



end
