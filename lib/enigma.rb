require 'date'
class Enigma
  def initialize
     @date_string = Date.today.strftime("%d%m%y")
     @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(message, key, date)
    encryption_array = []
    message_array = message.split
    message_array.each_with_index(0) do |letter|
      ecryption_array << alphabet(letter).shift(A)
  end
end
