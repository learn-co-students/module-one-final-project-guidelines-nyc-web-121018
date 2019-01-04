class ColorrPallet < ActiveRecord::Base
  belongs_to :colorr
  belongs_to :pallet

  def self.color_with_most_pallets
    color_and_pallet_instances = {}
    ColorrPallet.all.each do |instance|
      pallets_instance_arr = []
      pallets_instance_arr << instance.pallet_id
      color_and_pallet_instances[instance.colorr_id] = pallets_instance_arr
    end
    sorted_color_and_pallet_instances = color_and_pallet_instances.sort_by {|k,v| v}.reverse

    return *sorted_color_and_pallet_instances[0][0]
    #Colorr.find(color_instance.keys).name
  end


end #end of ColorrPallet class
