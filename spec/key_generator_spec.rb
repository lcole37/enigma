require "rspec"
require "./lib/key_generator"

RSpec.describe KeyGenerator do
	before :each do
		@key_generator = KeyGenerator.new
	end

	it "exists" do
		expect(@key_generator).to be_a(KeyGenerator) 
	end

	it "can generate random keys" do
		expect(@key_generator.random_key).to be_a(String)
    expect(@key_generator.random_key.length).to eq(5)
    expect(@key_generator.random_key[0]).to eq("0")
  end
end
