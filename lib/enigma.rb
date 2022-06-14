require 'date'
require_relative 'generator'
require_relative 'key_generator'

class Enigma
  def initialize
     @date_string = Date.today.strftime("%d%m%y")
     @alphabet = ("a".."z").to_a << " "
     @keygenerator = KeyGenerator.new
  end

  def encrypt(message, key = @keygenerator.random_key, date = @date_string)
    alphabet = @alphabet
    encryption_chars = []
    message_array = message.downcase.chars
    generator = Generator.new(message, key, date)
    shifts_array = generator.final_shifts.map{|shift| shift[1]}
    message_array.each_with_index do |letter, index|
      if alphabet.index(letter).nil?
        encryption_chars << letter
      else
        pre_shift_index = alphabet.index(letter)
        post_shift_alphabet = alphabet.rotate(shifts_array[index % 4])
        post_shift_letter = post_shift_alphabet[pre_shift_index]
        encryption_chars << post_shift_letter
      end
    end
    encrypted_message = encryption_chars.join
    encypted_hash = {encryption: encrypted_message, key: key, date: date}
  end

  def decrypt(message, key = @keygenerator.random_key, date = @date_string)
    alphabet = @alphabet
    decryption_chars = []
    message_array = message.downcase.chars
    generator = Generator.new(message, key, date)
    shifts_array = generator.final_shifts.map{|shift| shift[1]}
    message_array.each_with_index do |letter, index|
      if alphabet.index(letter).nil?
        decryption_chars << letter
      else
        pre_shift_alphabet = alphabet.rotate(shifts_array[index % 4])
        pre_shift_index = pre_shift_alphabet.index(letter)
        post_shift_letter = alphabet[pre_shift_index]
        decryption_chars << post_shift_letter
      end
    end
    decrypted_message = decryption_chars.join
    decrypted_hash = {decryption: decrypted_message, key: key, date: date}
  end
end
