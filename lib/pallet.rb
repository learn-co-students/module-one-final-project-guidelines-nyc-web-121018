#Pallet Class
  #4 colors per scheme
  #generate sechemes
  #get monochrome
  #get analogous
  #get complementary
  #get split complementary
    #right
    #left
  #get compound complementary
  #get Triadic
    #right
    #left

  #color 1 = base color
  #color 2 = analogous 1
  #color 3 = analogous 2
  #color 4 = complementary

# 1. Convert your colour to HSL.
#
# 2. Change the Hue value to that of the Hue opposite (e.g., if your Hue is 50°, the opposite one will be at 230° on the wheel — 180° further around).
#
# 3. Leave the Saturation and Lightness values as they were.
#
# 4. Convert this new HSL value back to your original colour notation (RGB or whatever).

class Pallet < ActiveRecord::Base
  has_many :colorr_pallets
  has_many :colorrs, through: :colorr_pallets

  @@hex_colors = RestClient.get 'https://raw.githubusercontent.com/jonathantneal/color-names/master/color-names.json'
  @@hex_colors_hash = JSON.parse(@@hex_colors)

  def self.rgb_arr_to_hex(rgb_arr)
    hexval = ""

    rgb_arr.each do |num_set|
      hex = num_set.to_s(16)
      if num_set < 16
        hexval << "0#{hex}"
      else
        hexval << hex
      end
    end
    return "##{hexval}"
  end

  # def self.find_monochromeatic
  #
  # end

  def self.find_analogous_warm(hexval)
    nopoundhex = hexval[1..-1]
    rgbval = Color::RGB.from_html(nopoundhex)
    r = rgbval.red
    g = rgbval.green
    b = rgbval.blue
    rgb_arr = [r,g,b]
    ar = 0
    ag = 0
    ab = 0

    if rgb_arr.max == r
      ar = r
      ab = b
      ag = g += 150
    end
    if rgb_arr.max == g
      ag = g
      ab = b
      ar = r += 150
    end
    if rgb_arr.max == b
      ag = g
      ab = b
      ar = r += 150
    end
    if rgb_arr.max == r && rgb_arr.max == g
      ag = g - 150
      ab = b
      ar = r
    end
    if rgb_arr.max == g && rgb_arr.max == b
      ag = g
      ab = b - 150
      ar = r
    end
    if rgb_arr.max == r && rgb_arr.max == b
      ag = g
      ab = b - 150
      ar = r
    end
    if ar > 255
      ar = 255
    end
    if ag > 255
      ag = 255
    end
    if ab > 255
      ab = 255
    end
    if ar < 0
      ar = 0
    end
    if ag < 0
      ag = 0
    end
    if ab < 0
      ab = 0
    end
    warm_rgb_arr = [ar.to_i,ag.to_i,ab.to_i]
    Pallet.rgb_arr_to_hex(warm_rgb_arr)
  end

  def self.find_analogous_cool(hexval)
    nopoundhex = hexval[1..-1]
    rgbval = Color::RGB.from_html(nopoundhex)
    r = rgbval.red
    g = rgbval.green
    b = rgbval.blue
    rgb_arr = [r,g,b]
    ar = 0
    ag = 0
    ab = 0
    if rgb_arr.max == r
      ar = r
      ab = b += 150
      ag = g
    end
    if rgb_arr.max == g
      ag = g
      ab = b += 150
      ar = r
    end
    if rgb_arr.max == b
      ag = g += 150
      ab = b
      ar = r
    end
    if rgb_arr.max == r && rgb_arr.max == g
      ag = g
      ab = b
      ar = r - 150
    end
    if rgb_arr.max == g && rgb_arr.max == b
      ag = g - 150
      ab = b
      ar = r
    end
    if rgb_arr.max == r && rgb_arr.max == b
      ag = g
      ab = b
      ar = r - 150
    end
    if ar > 255
      ar = 255
    end
    if ag > 255
      ag = 255
    end
    if ab > 255
      ab = 255
    end
    if ar < 0
      ar = 0
    end
    if ag < 0
      ag = 0
    end
    if ab < 0
      ab = 0
    end
    cool_rgb_arr = [ar.to_i,ag.to_i,ab.to_i]
    Pallet.rgb_arr_to_hex(cool_rgb_arr)
  end

  def self.find_complementary(hexval)
    nopoundhex = hexval[1..-1]
    rgbval = Color::RGB.from_html(nopoundhex)
    r = rgbval.red
    g = rgbval.green
    b = rgbval.blue
    rgb_arr = [r,g,b]
    cr = 0
    cg = 0
    cb = 0
    cr = rgb_arr.max + rgb_arr.min - r
    cg = rgb_arr.max + rgb_arr.min - g
    cb = rgb_arr.max + rgb_arr.min - b
    comp_rgb_arr = [cr.to_i,cg.to_i,cb.to_i]
    Pallet.rgb_arr_to_hex(comp_rgb_arr)
  end

  def self.print_pallet_from_id(id)
    Pallet.all.each do |instance|
      if id == instance.id
        puts "Your color's Analogous warm is: #{instance.analogous_warm}"
        puts "Your color's Analogous cool is: #{instance.analogous_cool}"
        puts "Your color's Complement is: #{instance.complementary}"
      end
    end
  end

  def self.print_pallet(hexval)
    Pallet.all.each do |instance|
      if hexval == instance.input_color
        puts "Your color's Analogous warm is: #{instance.analogous_warm}"
        puts "Your color's Analogous cool is: #{instance.analogous_cool}"
        puts "Your color's Complement is: #{instance.complementary}"
      end
    end
  end

end #end of Pallet class
