require 'date'
require_relative 'generator'
require_relative 'key_generator'

class Enigma
  attr_reader :alphabet,
              :date_string

  def initialize
     @date_string = Date.today.strftime("%d%m%y")
     @alphabet = ("a".."z").to_a << " "
     @keygenerator = KeyGenerator.new
  end

  def encrypt(message, key = @keygenerator.random_key, date = date_string)
    message_array = message.downcase.chars
    generator = Generator.new(message, key, date)
    shifts_array = generator.final_shifts.map{|shift| shift[1]}
    encrypted_message = shift_text(message_array, shifts_array, "encrypt")
    encypted_hash = {encryption: encrypted_message, key: key, date: date}
  end

  def decrypt(message, key = @keygenerator.random_key, date = date_string)
    message_array = message.downcase.chars
    generator = Generator.new(message, key, date)
    shifts_array = generator.final_shifts.map{|shift| shift[1]}
    decrypted_message = shift_text(message_array, shifts_array, "decrypt")
    decrypted_hash = {decryption: decrypted_message, key: key, date: date}
  end

  def shift_text(message_array, shifts_array, crypt_type)
    shifted_text_chars = []
    message_array.each_with_index do |letter, index|
      if alphabet.index(letter).nil?
        shifted_text_chars << letter
      else
        if crypt_type == "encrypt"
          pre_shift_index = alphabet.index(letter)
          post_shift_alphabet = alphabet.rotate(shifts_array[index % 4])
          post_shift_letter = post_shift_alphabet[pre_shift_index]
        else
          pre_shift_alphabet = alphabet.rotate(shifts_array[index % 4])
          pre_shift_index = pre_shift_alphabet.index(letter)
          post_shift_letter = alphabet[pre_shift_index]
        end
        shifted_text_chars << post_shift_letter
      end
    end
    shifted_text_chars.join
  end
end
