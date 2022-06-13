require './lib/enigma'

@enigma = Enigma.new
file1 = File.open(ARGV[0], "r")
message = file1.read
file2 = File.open(ARGV[1], "w")
decryption = enigma.decrypt(message)
file2.write(decryption)
file2.close

puts "Created #{ARGV[1]} with the key #{decryption[:key]} and date #{decryption[:date]}"
