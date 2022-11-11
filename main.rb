# encoding: UTF-8

require_relative "lib/garment"
require_relative "lib/smart_wardrobe"
require_relative "lib/garment_parser"

file_names = Dir["#{__dir__}/data/*.txt"]
puts "Сколько градусов за окном? (можно с минусом)"
temperature_now = STDIN.gets.to_i

wardrobe = SmartWardrobe.new(garments: GarmentParser.from_txt(file_names))

if wardrobe.empty?
  puts "Извините, ничего подходящего нет"
else
  puts "Предлагаем сегодня надеть:"
  puts wardrobe.generate_appearance(temperature_now)
end

