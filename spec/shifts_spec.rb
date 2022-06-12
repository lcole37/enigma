require "rspec"
require "date"
require "./lib/encryptor"

RSpec.describe Shifts do
	before :each do
		@shifts = Shifts.new
    @key = 02715
    @date = "040895"
	end

	it "exists" do
		expect(@shifts).to be_a(Shifts)
	end

	it "has can create keys" do
		expect(@shifts.keys(@key)).to eq({A: 02, B: 27, C: 71, D: 15})
	end

  it "can create date offsets" do
    expect(@shifts.offsets(@date)).to eq({A: 1, B: 0, C: 2, D: 5})
  end

  it 'can create shifts from keys/offsets' do
    expect(@shifts.final_shifts).to eq({A: 3, B: 27, C: 71, D: 15})
  end

end
