class SmartWardrobe
  def initialize(params)
    @garments = params[:garments]
    @temperature = params[:temperature]
  end

  def types
    @garments.map(&:type).uniq
  end

  def all_of_type(type)
    @garments.select { |garment| garment.type == type }
  end

  def fits(type)
    all_of_type(type).select{ |garment| garment.right_temperature?(@temperature) }
  end

  def generate
    types.map { |type| fits(type).sample }.compact
  end
end
