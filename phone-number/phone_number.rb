class PhoneNumber
  class << self
    def clean(number)
      sanitised_number = number.gsub(/[^\d]*/, '')

      if sanitised_number.chr == '1'
        sanitised_number[0] = ''
      end

      if sanitised_number.size != 10 ||
        invalid_area_code?(sanitised_number) ||
        invalid_exchange_code?(sanitised_number)
        return nil
      end

      sanitised_number
    end

    private

    def invalid_area_code?(number)
      ['0', '1'].any? { |el| number[0] == el }
    end

    def invalid_exchange_code?(number)
      ['0', '1'].any? { |el| number[3] == el }
    end
  end
end