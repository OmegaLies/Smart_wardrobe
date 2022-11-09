class SmartWardrobe
  def initialize(args)
    @garments = args[:garments]
  end

  def generate_appearance(temperature)
    types.filter_map { |type| fits(type, temperature).sample }
  end

  private

  def types
    @garments.map(&:type).uniq
  end

  def all_of_type(type)
    @garments.select { |garment| garment.type == type }
  end

  def fits(type, temperature)
    all_of_type(type).select{ |garment| garment.right_temperature?(temperature) }
  end
end
