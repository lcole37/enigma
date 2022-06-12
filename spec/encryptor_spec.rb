require "rspec"
require "date"
require "./lib/encryptor"

RSpec.describe Encryptor do
	before :each do
		@encryptor = Encryptor.new
    @key = 02715
    @date = "040895"
	end

	it "exists" do
		expect(@encryptor).to be_a(Encryptor)
	end

	it "has can create keys" do
		expect(@encryptor.keys(@key)).to eq({A: 02, B: 27, C: 71, D: 15})
	end

  it "can create date offsets" do
    expect(@encryptor.offsets).to eq({A: 1, B: 0, C: 2, D: 5})
  end

  it 'can create shifts from keys/offsets' do
    expect(@encryptor.shifts).to eq({A: 3, B: 27, C: 71, D: 15})
  end

end
