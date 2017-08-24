#CLI Controller (responsible for user interface)

class JocoLibrariesApp::CLI

  def call #beginning of interface
    list_libraries #list current public libraries scraped from website in numberical order
    library_lookup #lookup user selection
    goodbye
  end

  def list_libraries
    @libraries = JocoLibrariesApp::Libraries.current #refer to current method in Libraries class to be sure and pull most current list of libraries
  end

  def library_lookup
    input = nil
    while input != "exit"
    puts "Please enter the number of the location you would like more information or type exit to leave the program.  If you like to see the complete list of libraries located in Johnson County type 'list'."
    input = gets.strip

      if input.to_i > 0
        puts @libraries[input.to_i - 1] #list properties for this instance of the library w/i the array
      elsif input == "list"
        list_libraries
      else
        puts "That was not a valid selection.  Please try again."
      end
    end
  end


  def goodbye
    puts "Have a great day!"
  end

end
