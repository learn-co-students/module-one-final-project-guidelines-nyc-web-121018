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
    input_hex_color = gets.chomp.to_s

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
        Colorr.print_name(input_hex_color)
      when "2"
        Pallet.print_pallet(input_hex_color)
      when "3"
        Colorr.print_other_pallets(input_hex_color)
      when "4"
        Cli.exit_colorr
        Cli.help
        break
      end
    end

  end

  def self.learn
    learn_menu = <<-HELP
    - Analogous : groups of three colors that
    -   are next to each other on the color wheel
    -   because of this they are considered more
    -   harmonious
    -
    - Warm vs Cool : warm and cool are
    -   descriptive terms, not direct attributes.
    -   warm is used to describe colors closer to
    -   yellow and cool for colors closer to blue.
    -   warm colors push to the forground and
    -   cool colors pull to the background.
    -   Analogous warm and cool colors contrast
    -   without clashing.
    -
    - Complementary : Complementary colors are
    -   opposite eachother on the color wheel
    -   they are the definition of clashing!
    -   Good to use when you want to make a bold
    -   statement.
    HELP

    puts learn_menu
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
      when 'learn'
        Cli.learn
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
