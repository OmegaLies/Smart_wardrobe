#encoding: UTF-8

require 'rspec'
require "garment"
require "garment_parser"
require "smart_wardrobe"

describe SmartWardrobe do
  let(:garments_from_xml) { GarmentParser.from_txt(Dir["#{__dir__}/fixtures/*"]) }

  describe "#generate" do
    context "given input with one right set" do
      let(:result) do
        [
          "Кроссовки (Обувь) 0..25",
          "Джинсы (Штаны) -5..15",
          "Пальто (Верхняя одежда) -5..10"
        ]
      end

      it "Returns right set for temperature (0..10)" do
        0.upto 10 do |test_temperature|
          wardrobe = SmartWardrobe.new(
            garments: garments_from_xml,
            temperature: test_temperature
          )
          expect(wardrobe.generate_appearance.map(&:to_s)).to eq result
        end
      end
    end

    context "given input with more then one right set " do
      let(:results) { ["Кроссовки (Обувь) 0..25", "Шлепанцы (Обувь) 20..40"] }

      it "Returns one of two possible options" do
        20.upto 25 do |test_temperature|
          wardrobe = SmartWardrobe.new(
            garments: garments_from_xml,
            temperature: test_temperature
          )
          expect(results).to include wardrobe.generate_appearance[0].to_s
        end
      end
    end
  end
end
