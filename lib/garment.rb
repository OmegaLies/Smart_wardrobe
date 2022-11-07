class Garment
  attr_reader :name, :type, :temperature

  def initialize(params)
    @name = params[:name]
    @type = params[:type]
    @temperature = params[:temperature]
  end

  def right_temperature?(temperature)
    @temperature.include?(temperature)
  end

  def to_s
    "#{@name} (#{@type}) #{@temperature}"
  end
end
