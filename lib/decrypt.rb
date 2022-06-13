require './lib/enigma'

enigma = Enigma.new

file1 = File.open(ARGV[0], "r")
message = file1.read
file2 = File.open(ARGV[1], "w")
decryption = enigma.decrypt(message, ARGV[2], ARGV[3])
file2.write(decryption)
file2.close

puts "Created #{ARGV[1]} with the key #{ARGV[2]} and date #{ARGV[3]}"
