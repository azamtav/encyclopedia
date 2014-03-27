class WordParser 
	def self.parse(inputFile)
		@file = File.new(inputFile)
		@words = @file.read.split(' ').map do |word|
			word.chomp.downcase
		end
		@words.sort!
		return @words
	end	
end

@words = WordParser.parse('words.txt')
dict = {}
@words.each do |word|
	dict[word[0]] ||= []
	dict[word[0]] << word
end
puts dict

dict.keys.each do |alpha|
	print dict[alpha]
end