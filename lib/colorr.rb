require_relative '../config/environment'

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

class Colorr
  @@hex_colors = RestClient.get 'https://raw.githubusercontent.com/jonathantneal/color-names/master/color-names.json'
  @@hex_colors_hash = JSON.parse(@@hex_colors)
  # c = Color::RGB.from_html('101aff')
  # c_arr = [c.red, c.green, c.blue]

  #print hex val
    #given a color name
    #prints the hex val

  def self.get_hexval(name)
    @@hex_colors_hash.key(name)
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
    if @@hex_colors_hash.has_key?(hexval)
      puts "Your color name is: #{@@hex_colors_hash[hexval]}"
    else
      puts "that color does not exist yet!"
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
  #test passed!

  # def self.reds
  #
  # end

  #print oranges

  #print yellows

  #print greens

  #print blues

  #print purples

  #print random



end #end of Colorr class
