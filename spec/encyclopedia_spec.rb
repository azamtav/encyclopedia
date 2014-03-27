require_relative "spec_helper"

describe Encyclopedia do

	before :each do
		@words = WordParser.parse('words.txt')
		@enc = Encyclopedia.new(@words)
	end

	describe "#initialize" do
		
	end
	
end
