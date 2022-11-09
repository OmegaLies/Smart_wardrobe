#encoding: UTF-8

require "garment"

describe Garment do
  let(:garment) { Garment.new(name: "Пальто", type: "Верхняя одежда", temperature: (-5..10)) }

  describe "#initialize" do
    let(:expected_attributes) do
      {
        name: "Пальто",
        type: "Верхняя одежда",
        temperature: (-5..10)
      }
    end

    it 'assign correct attributes' do
      expect(garment).to have_attributes(expected_attributes)
    end
  end

  describe "#right_temperature?" do
    context "given valid temperature" do
      let(:temperature) { 0 }

      it "right_temperature? returns true" do
        expect(garment.right_temperature?(temperature)).to be true
      end
    end

    context "given invalid temperature" do
      let(:temperature) { -10 }

      it "right_temperature? returns false" do
        expect(garment.right_temperature?(temperature)).to be false
      end
    end
  end

  describe "#full_info" do
    it "Returns full info" do
      expect(garment.to_s).to eq "Пальто (Верхняя одежда) -5..10"
    end
  end
end
