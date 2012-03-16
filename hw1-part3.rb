def combine_anagrams(words)
	result = Hash.new
	words.each {|word| 
		(result.keys.any? {|key| key.anagram? word}) ? 
			result[word.sort.downcase] << word : 
			result[word.sort.downcase] = [word]} 
	result.values
end
	
# duck-tape sort onto String
class String
	def sort
		self.split(//).sort.join
	end

	def anagram?(str)
		self.sort.casecmp(str.sort).zero?
	end
end
