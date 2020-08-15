class ETL
  def self.transform(data)
    result = {}
    data.each do |key, values|
      values.each do |letter|
        result[letter.downcase] = key
      end
    end

    result
  end
end
