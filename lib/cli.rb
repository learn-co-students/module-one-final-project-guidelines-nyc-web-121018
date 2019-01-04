class Cli
  def self.welcome
    puts "Hello! Welcome to the Colorr cli!"
  end

  def self.help
    help = <<-HELP
    Commands:
    - help : displays this message
    - colorr : lets you choose a color to palletize(tm)
    - learn : learn about the pallets!
    - exit : exits this program
    HELP

    puts help
  end

  def self.colorr
    puts "Please enter a Hex Color Code:"
    input_hex_color = gets.chomp

    colorr_menu = <<-HELP
    Commands:
    - 1 : view the color's name
    - 2 : view the color's pallet
    - 3 : view other pallets that contain the color
    - 4 : back to help
    HELP

    puts colorr_menu

    input = ""
    while input
      puts "Please enter a command:"
      input = gets.chomp.to_s
      case input
      when "1"
        puts 'x'
      when "2"
        puts 'y'
      when "3"
        puts 'z'
      when "4"
        Cli.exit_colorr
        Cli.help
        break
      end
    end

  end

  def self.exit_colorr
    puts "Byeeeee!"
  end

  def self.run
    Cli.welcome
    Cli.help

    input = ""
    while input
      puts "Please enter a command:"
      input = gets.downcase.strip
      case input
      when 'colorr'
        Cli.colorr
      when 'help'
        Cli.help
      when 'exit'
        Cli.exit_colorr
        break
      else
        Cli.help
      end
    end
  end

end #end of class cli


#
# would you like to:
#
# 1. view the color's name (not all have names)
# 2. view the color's pallet
# 3. view other pallets that contain the color
