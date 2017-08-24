#CLI Controller (responsible for user interface)

class JocoLibrariesApp::CLI

  def call #beginning of interface
    list_libraries #list current public libraries scraped from website in numberical order
    library_lookup #lookup user selection
    goodbye
  end

  def list_libraries
    #scrape
    puts "Johnson County Public Libraries:"
    puts "1. OP"
    puts "2. stilwell"
  end

  def library_lookup
    input = nil
    while input != "exit"
    puts "Please enter the number of the location you would like more information or type exit to leave the program.  If you like to see the complete list of libraries located in Johnson County type 'list'."
      input = gets.chomp.downcase
      valid_input?(input)
      case input
      when "1"
        puts "library info....."
      when "2"
        puts "library info"
      when "list"
        list_libraries
      end
    end
  end

  def valid_input?(input)
  end

  def goodbye
    puts "Have a great day!"
  end

end
