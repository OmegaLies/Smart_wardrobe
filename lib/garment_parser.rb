module GarmentParser
  def from_txt(file_names)
    file_names.map do |file_name|
      lines = File.readlines(file_name, chomp: true)
      Garment.new(
        name: lines[0],
        type: lines[1],
        temperature: lines[2]
      )
    end
  end

  module_function :from_txt
end
