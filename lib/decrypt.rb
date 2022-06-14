require './lib/enigma'

if ARGV[0] == nil  #added in case user does not enter file input
  file_to_read = "encrypted.txt"
else
  file_to_read = ARGV[0]
end
if ARGV[1] == nil #added in case user does not enter file output
  file_to_write = "decrypted.txt"
else
  file_to_write = ARGV[1]
end
enigma = Enigma.new
file1 = File.open(file_to_read, "r")
message = file1.read
file2 = File.open(file_to_write, "w")
decryption = enigma.decrypt(message, ARGV[2], ARGV[3])
file2.write(decryption)
file2.close
puts "Created #{file_to_write} with the key #{ARGV[2]} and date #{ARGV[3]}"
