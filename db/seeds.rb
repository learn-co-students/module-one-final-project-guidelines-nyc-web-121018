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
  Pallet.create(
    input_color: instance.hexvalue,
    analogous_warm: Pallet.find_analogous_warm(instance.hexvalue),
    analogous_cool: Pallet.find_analogous_cool(instance.hexvalue),
    complementary: Pallet.find_complementary(instance.hexvalue)
  )
end


2331.times do
  ColorrPallet.create(
    colorr_id: Colorr.all.sample.id,
    pallet_id: Pallet.all.sample.id
  )
end



#for each color created by the pallet
#find its color_id
#class color.each do |instance|
# => instance.hex == :analogous_warm
# => return instance.id

#FOR EACH Pallet
#THERE ARE MANY colors

#FOR EACH Color
#THERE ARE MANY pallets
