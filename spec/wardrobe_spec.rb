#encoding: UTF-8

require "rspec"
require_relative "../lib/garment"
require_relative "../lib/smart_wardrobe"
require_relative "../lib/garment_parser"

describe Garment do
  test = Garment.new(name: "Пальто", type: "Верхняя одежда", temperature: "(-5, 10)")

  it "Возвращает название" do
    expect(test.name).to eq "Пальто"
  end

  it "Возвращает тип" do
    expect(test.type).to eq "Верхняя одежда"
  end

  it "Возвращает температуру как экземпляр Range" do
    expect(test.temperature).to eq -5..10
  end

  it "Возвращает false" do
    [-20, -10, -6, 11, 15, 20].each {|temperature| test.right_temperature?(temperature)}
  end

  it "Возвращает true" do
    [-5, -3, 0, 2, 7, 10].each {|temperature| test.right_temperature?(temperature)}
  end

  it "Возвращает строку с полной информацией" do
    expect(test.to_s).to eq "Пальто (Верхняя одежда) -5..10"
  end
end

describe GarmentParser do
  file_names = Dir["#{__dir__}/fixtures/*"]
  garments = GarmentParser.from_txt(file_names)
  result = [
    Garment.new(name: "Шапка-ушанка", type: "Головной убор", temperature: "(-20, -5)"),
    Garment.new(name: "Шлепанцы", type: "Обувь", temperature: "(20, 40)"),
    Garment.new(name: "Кроссовки", type: "Обувь", temperature: "(0, 25)"),
    Garment.new(name: "Джинсы", type: "Штаны", temperature: "(-5, +15)"),
    Garment.new(name: "Пальто", type: "Верхняя одежда", temperature: "(-5, +10)")
  ]

  it "Результат - массив" do
    expect(garments).to be_a Array
  end

  it "Элементы полученного массива - экземпляры класса Garment" do
    expect(garments).to all be_a Garment
  end

  it "Элементы сгенерированны верно" do
    expect(garments.map(&:to_s)).to eq result.map(&:to_s)
  end
end

describe SmartWardrobe do
  file_names = Dir["#{__dir__}/fixtures/*"]

  it "Возвращает верный набор для температуры от 0 до 10" do
    result = [
      "Кроссовки (Обувь) 0..25",
      "Джинсы (Штаны) -5..15",
      "Пальто (Верхняя одежда) -5..10"
    ]
    (0..10).each do |test_temperature|
      wardrobe = SmartWardrobe.new(
        garments: GarmentParser.from_txt(file_names),
        temperature: test_temperature
      )
      expect(wardrobe.generate_appearance.map(&:to_s)).to eq result
    end
  end

  it "Возвращает один из двух возможных вариантов" do
    results = [ "Кроссовки (Обувь) 0..25", "Шлепанцы (Обувь) 20..40"]
    (20..25).each do |test_temperature|
      wardrobe = SmartWardrobe.new(
        garments: GarmentParser.from_txt(file_names),
        temperature: test_temperature
      )
      expect(results).to include wardrobe.generate_appearance[0].to_s
    end
  end

end
