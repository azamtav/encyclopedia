require_relative "spec_helper"

describe Encyclopedia do

	before :each do
		@words = WordParser.parse('words.txt')
		@enc = Encyclopedia.new(@words)
	end

	describe "#initialize" do

	end

	describe "#getVolumes" do
		it "each volume should only have the letters" do
			volumes = @enc.getVolumes
			volumes.each
		end

	end
	
end
