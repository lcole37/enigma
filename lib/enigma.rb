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
    encryption_array = []
    # In general it's better not to use data types in variable names (message_chars might be a better name)
    message_array = message.downcase.chars
    generator = Generator.new(message, key, date)
    shifts_array = generator.final_shifts.map{|shift| shift[1]}
    message_array.each_with_index do |letter, index|
      # Creating an attr_reader for @alphabet would help it from being accidentally overwritten here
      if @alphabet.index(letter).nil?
        encryption_array << letter
      else
        pre_shift_index = @alphabet.index(letter)
        post_shift_alphabet = @alphabet.rotate(shifts_array[index % 4])
        post_shift_letter = post_shift_alphabet[pre_shift_index]
        encryption_array << post_shift_letter
      end
    end
    encrypted_message = encryption_array.join
    encypted_hash = {encryption: encrypted_message, key: key, date: date}
  end

  # One of the best methods for refactoring two similar functions is to move shared functionality
  # into a helper function.

  # Since these functions are almost identical except for whether or not the alphabet is shifted,
  # could you think of a way to refactor the same functionality into a shift_text function
  # that uses 'encrypt' or 'decrypt' as an argument? And how could you use that to refactor
  # the current encrypt and decrypt functions?

  # I'll start you off:

  # def shift_text(shift_type, key = @keygenerator.random_key, date = @date_string)
  #   ...
  #   if shift_type == 'encrypt'
  #     ...
  #   elsif shift_type == 'decrypt'
  #     ...
  #   end
  #   ...
  # end

  def decrypt(message, key = @keygenerator.random_key, date = @date_string)
    decryption_array = []
    message_array = message.downcase.chars
    generator = Generator.new(message, key, date)
    shifts_array = generator.final_shifts.map{|shift| shift[1]}
    message_array.each_with_index do |letter, index|
      if @alphabet.index(letter).nil?
        decryption_array << letter
      else
        pre_shift_alphabet = @alphabet.rotate(shifts_array[index % 4])
        pre_shift_index = pre_shift_alphabet.index(letter)
        post_shift_letter = @alphabet[pre_shift_index]
        decryption_array << post_shift_letter
      end
    end
    decrypted_message = decryption_array.join
    decrypted_hash = {decryption: decrypted_message, key: key, date: date}
  end
end
