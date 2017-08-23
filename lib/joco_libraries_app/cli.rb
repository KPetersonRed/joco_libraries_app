#CLI Controller (responsible for user interface)

class JocoLibrariesApp::CLI

  def call #beginning of interface
    puts "Thank you for using the Kansas Public Libraries database to find more information on public libraries nearest to you."
    get_zipcode
  end

  def get_zipcode
    puts "Please enter your 5 digit zipcode.  We will return information on the 5 libraries closest to you within a 25 mile radius."
    zip = gets.chomp
    valid_input?(zip)
    zip_lookup(zip)
  end

  def valid_input?(zip)
     #all numbers?  5 characters in length?
  end

  def zip_lookup(zip)
    # scrape www.publiclibraries.com/kansas.htm
    # Found?
      local_libraries_menu #within 25 mile radius
    #not found?
      #msg to user, reenter zip or try a different one
  end

  def local_libraries_menu
    input = nil
    puts "Please enter the number of the library you'd like more info or type exit to leave the program."
    while input != "exit"
    input = gets.chomp
  end

  def goodbye
    puts "Have a great day!"
  end

end
