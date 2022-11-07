#encoding: UTF-8

require "garment"
require "garment_parser"

describe GarmentParser do
  let(:garments) { GarmentParser.from_txt(Dir["#{__dir__}/fixtures/*"]) }
  let(:result) do
    [
      Garment.new(name: "Шапка-ушанка", type: "Головной убор", temperature: (-20..-5)),
      Garment.new(name: "Шлепанцы", type: "Обувь", temperature: (20..40)),
      Garment.new(name: "Кроссовки", type: "Обувь", temperature: (0..25)),
      Garment.new(name: "Джинсы", type: "Штаны", temperature: (-5..+15)),
      Garment.new(name: "Пальто", type: "Верхняя одежда", temperature: (-5..+10))
    ]
  end

  describe "#from_txt" do
    it "Return Array" do
       expect(garments).to be_a Array
    end

    it "Return Array, each element is Garment" do
      expect(garments).to all be_a Garment
    end

    it "Elements are parsed correctly" do
      expect(garments.map(&:to_s)).to eq result.map(&:to_s)
    end
  end
end
