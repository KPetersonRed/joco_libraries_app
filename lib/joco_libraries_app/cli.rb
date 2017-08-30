#CLI Controller (responsible for user interface)

class JocoLibrariesApp::CLI
#attr_accessor :libraries

  def call #beginning of interface
    puts "Welcome to Johnson County Libraries"
    puts "Here is the most up-to-date list of libraries in Johnson County, KS"
    @libraries = JocoLibrariesApp::Scraper.new.print_library_list
  #  binding.pry
    start
  end

  def start
    library_lookup
    goodbye
  end


  def print_libraries
  #  @libraries = JocoLibrariesApp::Scraper.make_libraries
  #binding.pry
    @libraries.each_with_index {|library, index|
      puts "#{i + 1}. #{library.name}"
    }
  end

  def library_lookup
    input = ""
    while input != "exit"
      puts "Please enter the number of the location you would like more information or type exit to leave the program.  If you like to see the complete list of libraries located in Johnson County type 'list'."
      input = gets.strip.to_i
      if input > 0
        library = JocoLibrariesApp::Libraries.find[input.to_i]
        print_library_details(library)
      elsif input == "list"
        print_libraries
      else
        puts "That was not a valid selection.  Please try again."
      end
    end
  end

  def print_library_details(library)
    puts "Location: #{library.address}"
    puts "Phone:"
    puts "Hours: #{library.hours}"
    puts "Website: #{library.url}"
  end


  def goodbye
    puts "Have a great day!"
  end

end
