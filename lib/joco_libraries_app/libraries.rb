class JocoLibrariesApp::Libraries

  attr_accessor :name, :address, :phone, :url, :hours
  @@all = []

  def initialize(name = nil, address = nil, phone = nil, hours = nil, url = nil)
    @name = name
    @address = address
    @phone = phone
    @hours = hours
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.list_libraries
    @@all.each_with_index {|song, index|
      puts "#{index + 1}. #{library.name}"
    }
  end

  def self.find(id)
    self.all[id-1]
  end

  def get_phone

  end

end
