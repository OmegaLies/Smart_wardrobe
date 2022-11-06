#encoding: UTF-8

require "rspec"
require "garment"
require "garment_parser"
require "smart_wardrobe"

describe SmartWardrobe do
  let(:file_names) { Dir["#{__dir__}/fixtures/*"] }

  describe "#generate" do
    context "Returns right set for temperature (0..10)" do
      let(:result) do
        [
          "Кроссовки (Обувь) 0..25",
          "Джинсы (Штаны) -5..15",
          "Пальто (Верхняя одежда) -5..10"
        ]
      end

      it do
        (0..10).each do |test_temperature|
          wardrobe = SmartWardrobe.new(
            garments: GarmentParser.from_txt(file_names),
            temperature: test_temperature
          )
          expect(wardrobe.generate_appearance.map(&:to_s)).to eq result
        end
      end
    end

    context "Returns one of two possible options" do
      let(:results) { ["Кроссовки (Обувь) 0..25", "Шлепанцы (Обувь) 20..40"] }

      it do
        (20..25).each do |test_temperature|
          wardrobe = SmartWardrobe.new(
            garments: GarmentParser.from_txt(file_names),
            temperature: test_temperature
          )
          expect(results).to include wardrobe.generate_appearance[0].to_s
        end
      end
    end
  end
end
