require "rspec"
require "./lib/enigma"

RSpec.describe Enigma do
	describe "Encryption and Decryption" do
		before :each do
			@enigma = Enigma.new
		end

		it "exists" do
			expect(@enigma).to be_a(Enigma)
		end

		it "can encrypt a message with a key and date" do
			expect(@enigma.encrypt("hello world!", "02715", "040895")).to eq({encryption: "keder ohulw!", key: "02715", date: "040895"})
		end

		it "can decrypt a message with a key and date" do
			expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq({decryption: "hello world", key: "02715", date: "040895"})
		end

		it "can encrypt a message with a key (uses today's date)" do
			encrypted = @enigma.encrypt("hello world", "02715")

			expect(encrypted).to be_a(Hash)
			expect(encrypted[:date]).to eq(Date.today.strftime("%d%m%y"))
		end

		it "can decrypt a message with a key (uses today's date)" do
			encrypted = @enigma.encrypt("hello world", "02715")

			expect(@enigma.decrypt(encrypted[:encryption], "02715")).to eq({decryption: "hello world",key: "02715",date: Date.today.strftime("%d%m%y")})
		end

		it "can encrypt a message (generates random key and uses today's date)" do
			encrypted = @enigma.encrypt("hello world")

			expect(encrypted).to be_a(Hash)
			expect(encrypted[:date]).to eq(Date.today.strftime("%d%m%y"))
			expect(encrypted[:key].length).to eq(5)
		end
	end
end
