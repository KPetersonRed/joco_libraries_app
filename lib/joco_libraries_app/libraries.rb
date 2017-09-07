class JocoLibrariesApp::Libraries

  attr_accessor :name, :phone, :address, :url, :hours
  @@all = []


  def self.new_from_index_page(x)
    self.new(
    x.css(".location_name").text.strip,
    x.css("p").text.strip,
    "https://jocolibrary.org#{x.css("a").attribute("href").value}",
    x.css(".oh-display").text.strip
    )
  end

  def initialize(name = nil, address = nil, url = nil, hours = nil)
    @name = name
    @address = address
    @url = url
    @hours = hours
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

end
