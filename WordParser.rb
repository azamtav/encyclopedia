class WordParser 
	def self.parse(inputFile)
		@file = File.new(inputFile)
		@words = @file.read.split(' ').map do |word|
			word.chomp
		end
		@words.sort_by! { |word| word.downcase }
		return @words
	end	
end