def palindrome?(string)
	prep_str(string) == prep_str(string).reverse
end
def prep_str(string)
	string.gsub(/[\W]/,"").downcase
end

def count_words(string)
	freq = Hash.new(0)
	string.scan(/\b\w+\b/) {|m| freq[m.downcase] += 1}
	return freq
end
