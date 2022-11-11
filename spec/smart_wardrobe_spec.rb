#encoding: UTF-8

require "garment"
require "smart_wardrobe"

describe SmartWardrobe do
  let(:wardrobe) do
    SmartWardrobe.new(
      garments: [
        Garment.new(name: "Шапка-ушанка", type: "Головной убор", temperature: -20..-5),
        Garment.new(name: "Шлепанцы", type: "Обувь", temperature: 20..40),
        Garment.new(name: "Кроссовки", type: "Обувь", temperature: 0..25),
        Garment.new(name: "Джинсы", type: "Штаны", temperature: -5..15),
        Garment.new(name: "Пальто", type: "Верхняя одежда", temperature: -5..10)
      ]
    )
  end

  describe "#generate_appearance" do
    context "given input with one right set" do
      let(:result) do
        [
          "Кроссовки (Обувь) 0..25",
          "Джинсы (Штаны) -5..15",
          "Пальто (Верхняя одежда) -5..10"
        ]
      end

      it "Returns right set for temperature" do
        0.upto 10 do |test_temperature|
          expect(wardrobe.generate_appearance(test_temperature).map(&:to_s)).to eq result
        end
      end
    end

    context "given input with more then one right set " do
      let(:results) do
        [
          ["Кроссовки (Обувь) 0..25"],
          ["Шлепанцы (Обувь) 20..40"]
        ]
      end

      it "Returns one of two possible options" do
        20.upto 25 do |test_temperature|
          expect(results).to include wardrobe.generate_appearance(test_temperature).map(&:to_s)
        end
      end
    end
  end
end
