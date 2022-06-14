require './lib/enigma'

if ARGV[0] == nil  #added in case user does not enter file input
  file_to_read = "message.txt"
else
  file_to_read = ARGV[0]
end
if ARGV[1] == nil #added in case user does not enter file output
  file_to_write = "encrypted.txt"
else
  file_to_write = ARGV[1]
end
enigma = Enigma.new
file1 = File.open(file_to_read, "r")
message = file1.read
file2 = File.open(file_to_write, "w")
encryption1 = enigma.encrypt(message)
file2.write(encryption1[:encryption])
file2.close
puts "Created #{file_to_write} with the key #{encryption1[:key]} and date #{encryption1[:date]}"
