class JocoLibrariesApp::Libraries

  attr_accessor :name, :phone, :address, :url, :hours, :status
  @@all = []


  def self.new_from_index_page(x)
    self.new(
    x.css(".location_name").text.strip,
    x.css("p").text.strip,
    #x.css("a").text.strip,
    x.css(".regular_hours").text.strip,
    x.css("a").attribute("href").value,
    x.css(".open-close").text.strip
    )
  end

  def initialize(name = nil, address = nil, hours = nil, url = nil, status = nil)
    @name = name
    @address = address
    @hours = hours
    @url = url
    @status = status
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end


  def phone
  end


end
