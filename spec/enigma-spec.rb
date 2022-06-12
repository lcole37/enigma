require "rspec"
require "./lib/enigma"

RSpec.describe Enigma do
	describe "Iteration 1" do
		before :each do
			@enigma = Enigma.new
      # @
		end

		it "exists" do
			expect(@enigma).to be_a(Enigma)
		end
	end
end
