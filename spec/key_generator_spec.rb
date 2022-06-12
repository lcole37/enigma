require "rspec"
require "./lib/class"

RSpec.describe KeyGenerator do
	before :each do
		@key_generator = KeyGenerator.new
	end

	it "exists" do
		expect(@key_generator).to be_a(KeyGenerator)
	end

	it "has attributes" do
		expect(@key_generator.random).to be_a(String)
    expect(@key_generator.random.length).to eq(5)
    expect(@key_generator.random[0]).to eq("0")
  end
end
