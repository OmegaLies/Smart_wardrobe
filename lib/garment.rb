class Garment
  attr_reader :name, :type, :temperature

  def initialize(args)
    @name = args[:name]
    @type = args[:type]
    @temperature = args[:temperature]
  end

  def right_temperature?(temperature)
    @temperature.include?(temperature)
  end

  def to_s
    "#{@name} (#{@type}) #{@temperature}"
  end
end
