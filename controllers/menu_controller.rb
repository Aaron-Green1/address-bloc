require_relative "../models/address_book"

class MenuController
  attr_reader :address_book
  
  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - View an entry by number"
    puts "3 - Create an entry"
    puts "4 - Search for an entry"
    puts "5 - Import entries from a CSV"
    puts "6 - Exit"
    print "Enter your Selection: "

    selection = gets.to_i
    
    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        view_entry_by_num
        main_menu
      when 3
        system "clear"
        create_entry
        main_menu
      when 4
        system "clear"
        search_entries
        main_menu
      when 5
        system "clear"
        read_csv
        main_menu
      when 6
        puts "Good bye!"
        exit(0)
      else 
        system "clear"
        puts "Sorry, that is not a valid input"
        main_menu
      end
  end
  
  def view_all_entries
    # iterate through all entries in AddressBook using each
    address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      # call entry_submenu to display a submenu for each entry
      entry_submenu(entry)
    end

    system "clear"
    puts "End of entries"
  end

  def view_entry_by_num
    print "Please enter an entry number (enter -1 to go back to main menu): "
    selection = gets.chomp.to_i
    
    if selection == -1
      main_menu
    elsif selection <= address_book.entries.length && selection > 0
      puts address_book.entries[selection - 1]
    else
      puts "Invalid entry"
      view_entry_by_num
    end
  end

  def create_entry

    system "clear"
    puts "New AddressBloc Entry"
    
    print "Name: " # Print is like puts, but it doesn't add a new line!
    name = gets.chomp
    print "Number: "
    number = gets.chomp
    print "Email: "
    email = gets.chomp

    address_book.add_entry(name, number, email)

    system "clear"
    puts "New entry created"
  end

  def search_entries

  end

  def read_csv

  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    selection = gets.chomp #chomp removes trailing whitespace from input
    
    case selection
      when "n"
      when "d"
      when "e"
      when "m"
        system "clear"
        main_menu
      else 
        system "clear"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
    end
  end
end