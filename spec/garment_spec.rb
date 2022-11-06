#encoding: UTF-8

require "rspec"
require "garment"

describe Garment do
  let(:garment) { Garment.new(name: "Пальто", type: "Верхняя одежда", temperature: "(-5, 10)") }

  describe ".name" do
    it "Returns name" do
      expect(garment.name).to eq "Пальто"
    end
  end

  describe ".type" do
    it "Returns type" do
      expect(garment.type).to eq "Верхняя одежда"
    end
  end

  describe ".temperature" do
    it "Returns temperature" do
      expect(garment.temperature).to eq -5..10
    end
  end

  describe ".right_temperature?" do
    context "given valid temperature" do
      it "right_temperature? returns true" do
        [-5, -3, 0, 2, 7, 10].each { |temperature| expect(garment.right_temperature?(temperature)).to eq true }
      end
    end
    context "given invalid temperature" do
      it "right_temperature? returns false" do
        [-20, -10, -6, 11, 15, 20].each { |temperature| expect(garment.right_temperature?(temperature)).to eq false }
      end
    end
  end

  describe ".right_temperature?" do
    it "Returns full info" do
      expect(garment.to_s).to eq "Пальто (Верхняя одежда) -5..10"
    end
  end
end
