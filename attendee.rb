class Attendee
  attr_accessor :attendee_data

    INVALID_ZIPCODE = "00000"
    INVALID_PHONE_NUMBER = "0000000000"

  def initialize(headers, values)
    self.attendee_data = Hash.new
    headers.each do |header|
      key = header[0].to_sym
      self.attendee_data[key] = values[key]
    end
    clean_data
  end

  private

  def clean_data
    attendee_data[:homephone] = clean_number(attendee_data[:homephone])
    attendee_data[:zipcode] = clean_zipcode(attendee_data[:zipcode])
  end

  def clean_number(number)
    number = remove_non_numbers(number)
      number = phone_to_ten_numbers(number)
   end

  def clean_zipcode(number)
      number = number.to_s
      number = remove_non_numbers(number)
      number = zip_to_five_numbers(number)
  end

  def remove_non_numbers(number)
      number = number.gsub(/[^\d]/, '') if number
   end

  def zip_to_five_numbers(number)
      if (1..4).include?(number.length)
        "0"*(5-number.length) + number
      elsif number.length != 5
        INVALID_ZIPCODE
      else
        number
      end
  end

    def phone_to_ten_numbers(number)
      if number.length == 11 && number.start_with?("1")
          number[1..-1]
      elsif number.length != 10
          INVALID_PHONE_NUMBER
      else
          number
      end
    end
end