#CLI Controller (responsible for user interface)

class JocoLibrariesApp::CLI
#attr_accessor :libraries

  def call #beginning of interface
    JocoLibrariesApp::Scraper.new.make_libraries
    puts "Welcome to Johnson County Libraries"
    puts "Here is the most up-to-date list of libraries in Johnson County, KS"
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
      puts "Please enter the number of the location you would like more information or type exit to leave the program.  If you like to see the complete list of libraries located in Johnson County type 'list'."
      input = gets.strip.downcase
      if input.to_i > 0
        library = JocoLibrariesApp::Libraries.find(input.to_i)
        print_library_details(library)
      elsif input == "list"
        list_libraries
      elsif input == "exit"
        puts "Thank you!  Goodbye"
      else
        puts "That was not a valid selection.  Please try again."
      end
    end
  end

  def print_library_details(library)
    puts "Name: #{library.name}"
    puts "Location: #{library.address}"
    puts "Phone:"
    puts "Hours: #{library.hours}"
    puts "Website: #{library.url}"
    puts "Open/Closed?  #{library.status}"
  end

end
