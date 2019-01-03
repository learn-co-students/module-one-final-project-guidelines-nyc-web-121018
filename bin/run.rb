require_relative '../config/environment'

#ColorPallet Class
  #Join table between colors and pallets

#Pallet Class
  #2 colors per scheme
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

#User Class
  #stores names (prompts first thing)
  #save and name pallets
  #veiw pallets
  #manipulate schemes
  #delete pallets

# Colorr class TESTS:
   # Colorr.print_hexval("Mandarin")
   # Colorr.print_name("#aa4069")
   # Colorr.print_RGB("Ultra Pink")
   # Colorr.print_RGB("#3c1f76")
      # consol pasta:
       # // ♥ bundle exec ruby bin/run.rb
       #  Your hexvalue is: #f37a48
       #  Your color name is: Medium Ruby
       #  Your RGB value is:[255.0, 111.0, 255.0]
       #  Your RGB value is:[60.0, 31.0, 118.0]
    c = Colorr.all_to_RGB


binding.pry

puts "HELLO WORLD"

# bundle exec ruby bin/run.rb
