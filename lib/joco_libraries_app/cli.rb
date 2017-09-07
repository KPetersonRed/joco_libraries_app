class JocoLibrariesApp::CLI
#attr_accessor :libraries

  def call #beginning of interface
    JocoLibrariesApp::Scraper.new.make_libraries
    puts ""
    puts "WELCOME TO THE JOHNSON COUNTY LIBRARIES APP"
    puts "Here is the most up-to-date list of libraries in Johnson County, KS"
    puts""
    get_alerts
    puts ""
    list_libraries
    library_lookup
  end

  def list_libraries
    JocoLibrariesApp::Libraries.all.each_with_index {|library, index|
      puts "#{index + 1}. #{library.name}"
    }
  end


  def library_lookup
    input = nil
    while input != "exit"
      puts ""
      puts "Which location would you like to learn more about?  Please type the number of that location and hit 'enter'. To exit the program type 'exit'.  If you would like to see the complete list of libraries located in Johnson County type 'list'."
      input = gets.strip.downcase
      if input.to_i > 0
        library = JocoLibrariesApp::Libraries.find(input.to_i)
        print_library_details(library)
      elsif input == "list"
        list_libraries
      elsif input == "exit"
        puts "Thank you for using the Johnson County Libraries App!  Goodbye"
      else
        puts "That was not a valid selection.  Please try again."
      end
    end
  end

  def print_library_details(library)
    puts "NAME: #{library.name}"
    puts "PHONE NUMBER: 913-826-4600"
    puts "ADDRESS: #{library.address}"
    puts "WEBSITE: #{library.url}"
    puts ""

    #split hours out to print on multiple lines
    array = library.hours.split(/\b\s\w[pm]\s/)
    puts "LIBRARY HOURS: "
    array.each {|hours| puts "#{hours}"}
  end

  def get_alerts
    alerts = Nokogiri::HTML(open("https://www.jocolibrary.org/locations"))
    alerts = alerts.css(".content").text.strip
    alerts = alerts.split("read more").join
    if alerts != "" then puts "IMPORTANT ALERTS: #{alerts}" end
  end

end
