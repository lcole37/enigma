require 'date'
require_relative 'generator'
require_relative 'key_generator'
# require_relative 'encryption'

class Enigma
  def initialize
     @date_string = Date.today.strftime("%d%m%y")
     @alphabet = ("a".."z").to_a << " "
     @keygenerator = KeyGenerator.new
  end

  def encrypt(message, key = @keygenerator.random_key, date = @date_string)
    ### things look good up to here ###
    encryption_array = []
    message_array = message.downcase.chars
    generator = Generator.new(message, key, date)
    shifts_array = generator.final_shifts.map{|shift| shift[1]}

    message_array.each_with_index do |letter, index|
      if @alphabet.index(letter).nil?
        letter
      else
        pre_shift_index = @alphabet.index(letter)
        post_shift_alphabet = @alphabet.rotate(shifts_array[index % 4])
        post_shift_letter = post_shift_alphabet[pre_shift_index]
        encryption_array << post_shift_letter
      end
    end
      # require "pry"; binding.pry
    encrypted_message = encryption_array.join

    encypted_hash = {encryption: encrypted_message, key: key, date: date}
  end

  def decrypt(message, key, date = date_string)

  end
end
