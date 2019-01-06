class Cli
  def self.welcome
    puts "Hello! Welcome to the Colorr cli!"
  end

  def self.home
    help = <<-MENU
    Home:
    - 1 : enter a hex color to palletize(tm)!
    - 2 : get a random hex color
    - 3 : learn about the pallets!
    - 4 : exits this program
    MENU

    puts help
  end

  def self.colorr
    puts "Please enter a Hex Color Code:"
    input_hex_color = gets.chomp.to_s

    colorr_menu = <<-MENU
    Colorr Commands:
    - 1 : view the color's name
    - 2 : view the color's pallet
    - 3 : view other pallets that contain the color
    - 4 : view the color with the most pallets
    - 5 : back to home
    MENU

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
        x = Colorr.print_other_pallets(input_hex_color)
        puts x
        x.each do |i|
          Pallet.print_pallet_from_id(i)
        end
      when "4"
        x = ColorrPallet.color_with_most_pallets
        puts Colorr.find(x.join.to_i).name,Colorr.find(x.join.to_i).hexvalue
      when "5"
        Cli.exit_colorr
        Cli.home
        break
      end
    end

  end

  def self.learn
    learn_menu = <<-MENU
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
    MENU

    puts learn_menu
  end

  def self.exit_colorr
    puts "Byeeeee!"
  end

  def self.run
    Cli.welcome
    Cli.home

    input = ""
    while input
      puts "Please enter a command:"
      input = gets.downcase.strip
      case input
      when '1'
        Cli.colorr
      when '2'
        # put random color method here
      when '3'
        Cli.learn
      when '4'
        Cli.exit_colorr
        break
      else
        Cli.home
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
