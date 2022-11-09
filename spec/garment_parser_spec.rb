#encoding: UTF-8

require "garment"
require "garment_parser"

describe GarmentParser do
  let(:garments) { GarmentParser.from_txt(Dir["#{__dir__}/fixtures/*"]) }

  describe "#from_txt" do
    it "Return Array" do
       expect(garments).to be_a Array
    end

    it "Return Array, each element is Garment" do
      expect(garments).to all be_a Garment
    end

    it "Elements are parsed correctly" do
      expect(garments).to contain_exactly(
                            have_attributes(name: "Шапка-ушанка", type: "Головной убор", temperature: -20..-5),
                            have_attributes(name: "Шлепанцы", type: "Обувь", temperature: 20..40),
                            have_attributes(name: "Кроссовки", type: "Обувь", temperature: 0..25),
                            have_attributes(name: "Джинсы", type: "Штаны", temperature: -5..+15),
                            have_attributes(name: "Пальто", type: "Верхняя одежда", temperature: -5..+10)
      )
    end
  end
end
