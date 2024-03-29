def combine_anagrams(words)
	result = Hash.new(Array.new)
	return words unless words.respond_to?("each")
  words.each {|word| result[word.downcase.sort] += [word]}
  result.values
end

# duck-tape sort onto String
class String
	def sort
		self.split(//).sort.join
	end

	def anagram?(str)
		self.downcase.sort == str.downcase.sort
	end
end
