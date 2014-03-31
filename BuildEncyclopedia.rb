require_relative "WordParser"
require_relative "Encyclopedia"

words = WordParser.parse('words.txt')
desiredVolumes = 10
enc = Encyclopedia.new(words, desiredVolumes)
enc.merge()
enc.print()