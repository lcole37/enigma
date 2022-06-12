require 'date'
class Enigma
  def initialize
     @date_string = Date.today.strftime("%d%m%y")
     @alphabet = ("a".."z").to_a << " "
     @generator = Generator.new
  end

  def encrypt(message, key, date)
    encryption_array = []
    message_array = message.split("")
    keys = generator.keys(key)
    offsets = generator.offsets(date)
    shifts = generator.shifts(keys, offsets)

    shifts.values.each do |shift|
      # split into 4 arrays, or x arrays of 4 a-d
      # enumerate over those, shifting by corresponding a-d
      # message_array.each_with_index(0) do |letter|
      #   ecryption_array << ____ + shift
      # end
    end
  end
end
