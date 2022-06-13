require './lib/enigma'

enigma = Enigma.new
file1 = File.open(ARGV[0], "r")
message = file1.read
file2 = File.open(ARGV[1], "w")
encryption1 = enigma.encrypt(message)
file2.write(encryption1[:encryption])
file2.close
puts "Created #{ARGV[1]} with the key #{encryption1[:key]} and date #{encryption1[:date]}"
