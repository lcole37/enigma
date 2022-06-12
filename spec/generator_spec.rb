require "rspec"
require "./lib/generator.rb"

RSpec.describe Generator do
	before :each do
		@generator = Generator.new
    @key = "02715"
    @date = "040895"
	end

	it "exists" do
		expect(@generator).to be_a(Generator)
	end

	it "can generate random keys" do
		expect(@generator.random_key).to be_a(String)
    expect(@generator.random_key.length).to eq(5)
    expect(@generator.random_key[0]).to eq("0")
  end

  it "can generate A-D keys from the key" do
		expect(@generator.keys(@key)).to eq({A: 02, B: 27, C: 71, D: 15})
	end

  it "can create date offsets" do
    expect(@generator.offsets(@date)).to eq({A: 1, B: 0, C: 2, D: 5})
  end

  it 'can create shifts from keys/offsets' do
    keys = @generator.keys(@key)
    offsets = @generator.offsets(@date)

    expect(@generator.final_shifts(keys, offsets)).to eq({A: 3, B: 27, C: 73, D: 20})
  end
end
