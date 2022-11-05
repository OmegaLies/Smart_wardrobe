class Garment
  attr_reader :name, :type, :temperature
  def initialize(params)
    @name = params[:name]
    @type = params[:type]
    @temperature = str_to_range(params[:temperature])
  end

  def right_temperature?(temperature)
    @temperature.include?(temperature)
  end

  def to_s
    "#{@name} (#{@type}) #{@temperature}"
  end

  private

  def str_to_range(string)
    tmp = string.delete("(").split(", ").map(&:to_i)
    Range.new(tmp[0],tmp[1])
  end
end
