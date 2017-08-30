class JocoLibrariesApp::Libraries

  #store library objects in array
  #add library attributes

  attr_accessor :name, :address, :phone, :url, :hours
  @@all = []

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  
end
