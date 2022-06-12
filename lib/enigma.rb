require 'date'
class Enigma
  def initialize
     @date_string = Date.today.strftime("%d%m%y")
     @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(message, key, date)
    encryption_array = []
    shifts = Shifts.final_shifts(key)
    message_array = message.split

    shifts.each do |shift|
      message_array.each_with_index(0) do |letter|
        ecryption_array << ____ + shift
      end
    end
  end
end
