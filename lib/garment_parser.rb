module GarmentParser
  def from_txt(file_names)
    file_names.map do |file_name|
      lines = File.readlines(file_name, chomp: true)
      Garment.new(
        name: lines[0],
        type: lines[1],
        temperature: str_to_range(lines[2])
      )
    end
  end

  private

  def str_to_range(string)
    Range.new(*string.delete("(").split(", ").map(&:to_i))
  end

  module_function :from_txt, :str_to_range
end
