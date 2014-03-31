require_relative "spec_helper"

describe Encyclopedia do

	before :all do
		@words = WordParser.parse('words.txt')		
		@desiredVolumes = 10
		@randomVolume = {"a" => ["apple", "ace", "adventure"], "b" => ["banana", "boy", "brash"], "c" => ["cat", "cobweb", "candy", "cream", "caterpillar"]}
	end

	before :each do
		@enc = Encyclopedia.new(@words, @desiredVolumes)
	end

	describe "#initialize" do
		it "should return the instance variable for each" do
			@enc.desiredVolumes.should == 10
			@enc.maxWordCount.should > 0
			@enc.avgWordCount.should > 0
			@enc.volumes.should_not == {}
			@enc.totalWordCount.should > 0
			@enc.mergedVolumes.should_not == nil
		end
	end

	describe "#groupVolumesByFirstLetter" do
		subject(:volumes) { @enc.groupVolumesByFirstLetter(@words) }
		it "should return a hash of letters for keys" do
			volumes.each_key do |key|
				key.scan(/\w/).should_not == []
			end
		end
		it "should be in alphabetical order" do
			prevKey = nil
			volumes.each do |key, value|
				if prevKey
					prevKey.should < key
				end
				prevKey = key				
			end
		end
	end	

	describe "#findMaxWordCount" do
		it "should return the max number of words in a volume" do			
			@enc.findMaxWordCount(@randomVolume).should == 5
		end
	end

	describe "#mergeVolumes" do
		subject(:vol1) { {"a" => @randomVolume["a"]} }
		subject(:vol2) { {"b" => @randomVolume["b"]} }
		it "should return a hash with the keys of both volumes" do
			mergedVolumes = @enc.mergeVolumes(vol1, vol2)
			mergedVolumes.has_key?("a-b").should == true			
		end
		it "should return an array of both volumes" do
			mergedVolumes = @enc.mergeVolumes(vol1, vol2)
			mergedVolumes["a-b"].should == vol1["a"] + vol2["b"]
			mergedVolumes["a-b"].size.should == vol1["a"].size + vol2["b"].size			
		end
	end

	describe "#findMergeCandidates" do
		it "should" do
			smallestVolumes = @enc.findMergeCandidates(@enc.volumes)
		end
	end

	describe "#merge" do
		subject(:mergedVolumes) { @enc.merge() }
		subject(:originalVolumes) { @enc.volumes }
		it "should return a hash of volumes sorted" do
			prevKey = nil
			mergedVolumes.each do |key, value|
				if prevKey
					prevKey.should < key
				end
				prevKey = key
			end
		end
		it "should return hash key groups in alphabetical order" do
			mergedVolumes.each do |key, value|
				if(key.length > 1)
					key[0].should < key[-1]
				end
			end
		end
		it "should return hash keys containing the correct words" do
			mergedVolumes.each do |key, value|
				wordRange = Range.new(key[0], key[-1])				
				value.each do |word|
					letter = word[0].downcase
					wordRange.cover?(letter).should be(true)
				end
			end
		end
		it "should contain the same number of words as the original word list" do
			mergedVolWordCount = 0
			mergedVolumes.each do |key, value|
				mergedVolWordCount += value.size
			end
			mergedVolWordCount.should == @words.size
		end
		it "should contain the desired number of volumes" do
			mergedVolumes.keys.size.should == @desiredVolumes
		end
		it "should contain words in the key range" do
			mergedVolumes.each do |key, value|
				keyRange = Range.new(key[0], key[-1])
				value.each do |word|
					keyRange.include?(word[0].downcase).should == true
				end
			end
		end
	end
end
