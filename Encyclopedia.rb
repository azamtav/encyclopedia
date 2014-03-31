require 'pp'

class Encyclopedia
	attr_accessor :desiredVolumes, :maxWordCount, :avgWordCount, :volumes, :totalWordCount, :mergedVolumes

	def initialize(words, desiredVolumes)
		raise ArgumentError, 'words is empty' if words == []
		raise ArgumentError, 'desiredVolumes must be greater than 0' if desiredVolumes < 0
		@words = words
		@desiredVolumes = desiredVolumes
		@volumes = groupVolumesByFirstLetter(@words)		
		@totalWordCount = @words.size
		@avgWordCount = @totalWordCount / @volumes.keys.size		
		@maxWordCount = findMaxWordCount(@volumes)
		@mergedVolumes = {}
		@mergeCount = 0
	end

	# groups volumes of words by their first letter
	def groupVolumesByFirstLetter(words)
		volumes = {}
		words.each do |word|
			key = word[0].downcase
			if volumes[key]			
				volumes[key] << word
			else
				volumes[key] = [] << word
			end
		end
		volumes = Hash[volumes.sort]
		return volumes
	end

	# gets the volume with the largest wordcount
	def findMaxWordCount(volumes)
		maxWordCount = 0
		volumes.each do |key, value|
			maxWordCount = volumes[key].size if volumes[key].size > maxWordCount
		end
		return maxWordCount
	end

	# merges two volumes by joining their keys and value arrays
	def mergeVolumes(volume1, volume2)
		mergedVolume = {}
		key1 = volume1.keys.join[0]
		key2 = volume2.keys.join[-1]
		keysCombined = "#{key1}-#{key2}"
		mergedVolume[keysCombined] = []
		volume1.each do |key, value|
			mergedVolume[keysCombined].concat(value)
		end
		volume2.each do |key, value|
			mergedVolume[keysCombined].concat(value)
		end
		return mergedVolume
	end

	# finds the two volumes, when merged, form the smallest merge result
	def findMergeCandidates(volumes)
		smallestMergeSize = nil
		smallestMergeKeys = []
		prevKey = nil

		volumes.each do |key, val|
			if prevKey
				if smallestMergeSize
					if volumes[key].size + volumes[prevKey].size < smallestMergeSize
						smallestMergeSize = volumes[key].size + volumes[prevKey].size
						smallestMergeKeys = [] << key << prevKey
					end
				else
					smallestMergeSize = volumes[key].size + volumes[prevKey].size
					smallestMergeKeys << key << prevKey
				end
				prevKey = key
			else
				prevKey = key
			end
		end
		return smallestMergeKeys
	end

	# merges volumes until the size of the merged volumes is equal to the desired volumes
	def merge()		
		@mergedVolumes = @volumes.dup
		while (@mergedVolumes.keys.size > @desiredVolumes) do
			mergeCandidates = findMergeCandidates(@mergedVolumes)
			volume1 = @mergedVolumes.select{ |k,v| k == mergeCandidates[1]}
			volume2 = @mergedVolumes.select{ |k,v| k == mergeCandidates[0]}
			tempMergedVolumes = mergeVolumes(volume1, volume2)
			@mergedVolumes.delete(mergeCandidates[0])
			@mergedVolumes.delete(mergeCandidates[1])
			@mergedVolumes.merge!(tempMergedVolumes)	
			@mergedVolumes = Hash[@mergedVolumes.sort]
			@mergeCount += 1
		end
		return @mergedVolumes
	end

	# prints the encyclopedia volumes using pretty-print
	def print()
		pp @mergedVolumes
	end
end