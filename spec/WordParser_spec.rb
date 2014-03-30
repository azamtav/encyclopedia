require_relative "spec_helper"

describe WordParser do
	before :each do
		@words = WordParser.parse('words.txt')
	end

	describe "#parse" do
		it "should return an array" do
			@words.class.name.should == 'Array'
		end
		it "should not be empty" do
			@words.size.should > 0
		end
		it "should not have any spaces in each word" do
			@words.each do |word|
				word.scan(/\s+/).size.should == 0
			end
		end
		it "should sort the words" do
			@words.each_with_index do |val, index| 
				if index + 1 < @words.size
					@words[index].downcase.should < @words[index + 1].downcase
				end
			end
		end
	end
end