require_relative '../config/environment'

Colorr.destroy_all
Pallet.destroy_all
ColorrPallet.destroy_all

hex_colors = RestClient.get 'https://raw.githubusercontent.com/jonathantneal/color-names/master/color-names.json'
hex_colors_hash = JSON.parse(hex_colors)



hex_colors_hash.each do |hexval, color_name|
  Colorr.create(hexvalue: hexval, name: color_name)
end

Colorr.all.each do |instance|
  Colorr.create(hexvalue:Pallet.find_analogous_warm(instance.hexvalue), name: instance.name + "AW")
  Colorr.create(hexvalue:Pallet.find_analogous_cool(instance.hexvalue), name: instance.name + "AC")
  Colorr.create(hexvalue:Pallet.find_complementary(instance.hexvalue), name: instance.name + "C")
end

grouped_hex_values = Colorr.all.group_by do |instance|
  [instance.hexvalue]
end

grouped_hex_values.values do |hexval|
  first_one = hexval.shift
  hexval.each{|hexval| double.destroy}
end


#HAS ALL POSSIBLE COLORS

hex_colors_hash.each do |hexval, color_name|
  Pallet.create(
    origin_color: hexval,
    analogous_warm: Pallet.find_analogous_warm(hexval),
    analogous_cool: Pallet.find_analogous_cool(hexval),
    complementary: Pallet.find_complementary(hexval)
  )
end

Pallet.all.each do |instance|
  ColorrPallet.create(
    colorr_id: Colorr.get_colorr_id_given_hexval(instance.origin_color),
    pallet_id: instance.id
  )
  ColorrPallet.create(
    colorr_id: Colorr.get_colorr_id_given_hexval(instance.analogous_warm),
    pallet_id: instance.id
  )
  ColorrPallet.create(
    colorr_id: Colorr.get_colorr_id_given_hexval(instance.analogous_cool),
    pallet_id: instance.id
  )
  ColorrPallet.create(
    colorr_id: Colorr.get_colorr_id_given_hexval(instance.complementary),
    pallet_id: instance.id
  )
end
