# metaprogramming to the rescue!

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
end

# turn Enumerable to array & then use the join to 
# convert the array to a string. 
module Enumerable
	def palindrome?; self.to_a.join.palindrome?; end
end

class String
	def palindrome?
		self.gsub(/[\W]/,"").downcase == self.gsub(/[\W]/,"").downcase.reverse
	end
end

class Fixnum
	def method_missing(method_id, *args)
		name = method_id.to_s
		if name =~ /^(second|minute|hour|day)$/
			self.send(name + 's')
		else
			super # pass the buck to the superclass
		end
	end

	def seconds ; 	self ;	end
	def minutes	;	self.seconds * 60 ; end
	def hours	;	self.minutes * 60 ; end
	def days	;	self.hours * 24 ; end
	def ago		;	Time.now - self ; end
	def from_now;	Time.now + self ; end
end
