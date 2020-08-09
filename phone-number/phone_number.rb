class PhoneNumber
  REGEX_US_PHONE_NUMBER = /^([2-9]\d\d){2}\d{4}$/.freeze # check the format of a phone number
  REGEX_CLEAN = /[\ +().-]/.freeze # remove all non needed char

  def self.clean(phone_number)
    clean_number = phone_number.gsub(REGEX_CLEAN, '').sub(/^1/, '')
    clean_number if clean_number.match(REGEX_US_PHONE_NUMBER)
  end
end


# class PhoneNumber
#   class << self
#     def clean(number)
#       sanitised_number = number.gsub(/[^\d]*/, '')
#
#       if sanitised_number.chr == '1'
#         sanitised_number[0] = ''
#       end
#
#       if sanitised_number.size != 10 ||
#         invalid_area_code?(sanitised_number) ||
#         invalid_exchange_code?(sanitised_number)
#         return nil
#       end
#
#       sanitised_number
#     end
#
#     private
#
#     def invalid_area_code?(number)
#       ['0', '1'].any? { |el| number[0] == el }
#     end
#
#     def invalid_exchange_code?(number)
#       ['0', '1'].any? { |el| number[3] == el }
#     end
#   end
# end