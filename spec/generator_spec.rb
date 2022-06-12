require "rspec"
require "./lib/generator.rb"

RSpec.describe Generator do
	before :each do
		@generator = Generator.new
	end

	it "exists" do
		expect(@generator).to be_a(Generator)
	end

	it "has attributes" do
		expect(@generator.random_key).to be_a(String)
    expect(@generator.random_key.length).to eq(5)
    expect(@generator.random_key[0]).to eq("0")
  end
end
