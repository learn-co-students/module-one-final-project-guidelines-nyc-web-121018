#there are 2331 colors in the API

  #Colorr Class
    #print color
    #print color of major kind
      #Map through to get an array of diffrent colors
      # R   O    Y   G   B   P
      #  RO   OY  YG  GB  BP  PR
      #ie get colors.blues
    #lighten color
    #darken color
    #saturate color
    #desaturate color

class Colorr < ActiveRecord::Base
  has_many :colorr_pallets
  has_many :pallets, through: :colorr_pallets

  @@hex_colors = RestClient.get 'https://raw.githubusercontent.com/jonathantneal/color-names/master/color-names.json'
  @@hex_colors_hash = JSON.parse(@@hex_colors)
  # c = Color::RGB.from_html('101aff')
  # c_arr = [c.red, c.green, c.blue]

  #print hex val
    #given a color name
    #prints the hex val

  def self.get_hexval(name)
    hexval_w_pound = @@hex_colors_hash.key(name)
    nopound = hexval_w_pound[1..-1]
    return nopound
  end

  def self.print_hexval(name)
    if @@hex_colors_hash.has_value?(name)
      puts "Your hexvalue is: #{Colorr.get_hexval(name)}"
    else
      puts "that color does not exist yet!"
    end
  end
  #test worked!

  #print name
    #given a hexval
    #prints name

  def self.print_name(hexval)
    # if @@hex_colors_hash.has_key?(hexval)
    #   puts "Your color's name is: #{@@hex_colors_hash[hexval]}"
    # else
    #   puts "Your color does not have a name yet!"
    # end
    Colorr.all.each do |instance|
      if hexval == instance.hexvalue
        puts "Your color's name is: #{instance.name}"
      end
    end
  end

  def self.print_other_pallets(hexval)
    Colorr.all.each do |instance|
      if hexval == instance.hexvalue
        pallets_instance_arr = []
        pallets_instance_arr << instance.pallets
        puts pallets_instance_arr
      end
    end
  end
  #tests worked

  #to_RGB
    #helper method
    #returns the RGB given a hexval

  def self.to_RGB_arr(hexval)
    rgb = Color::RGB.from_html(hexval)
    rgb_arr = [rgb.red, rgb.green, rgb.blue]
    return rgb_arr
  end

  #prints the RBG value given a nameorhex with # infront for the hex
  def self.print_RGB(nameorhex)
    if nameorhex[0] == '#'
      nopound = nameorhex[1..-1]
      puts "Your RGB value is:#{Colorr.to_RGB_arr(nopound)}"
    else
      hex = Colorr.get_hexval(nameorhex)
      nopoundhex = hex[1..-1]
      puts "Your RGB value is:#{Colorr.to_RGB_arr(nopoundhex)}"
    end
  end

  #print reds
    #goes through the @@hex_colors_hash
    #returns all values that can be considered red
    #converts the hex keys to RGB
    #some applies limit if color_object.red >= amount <<

  @hex_color_and_RGB_hash = {}

  def self.all_to_RGB
    @@hex_colors_hash.each do |hex, name|
      nopoundhex = hex[1..-1]
      @hex_color_and_RGB_hash [hex] = Colorr.to_RGB_arr(nopoundhex)
    end
    return @hex_color_and_RGB_hash
  end

end #end of Colorr class
