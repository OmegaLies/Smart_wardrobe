class SmartWardrobe
  def initialize(params)
    @garments = params[:garments]
    @temperature = params[:temperature]
  end

  def generate_appearance
    types.filter_map { |type| fits(type).sample }
  end

  private

  def types
    @garments.map(&:type).uniq
  end

  def all_of_type(type)
    @garments.select { |garment| garment.type == type }
  end

  def fits(type)
    all_of_type(type).select{ |garment| garment.right_temperature?(@temperature) }
  end
end
