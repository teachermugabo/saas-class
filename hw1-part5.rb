class Class
	def attr_accessor_with_history(attr_name)
		attr_name = attr_name.to_s			# make sure it's a string
		attr_reader attr_name 				# attribute's getter
		#attr_writer attr_name
		attr_reader attr_name+"_history"	# create bar_history
		class_eval %Q{
		def attr_name=(attr_val)
			@attr_name = attr_val
		end}
	end
end

#@attr_name_history << @attr_name

class Foo 
	attr_accessor_with_history :bar
end

f = Foo.new 	# => #<Foo:0x127e678>
f.bar = 3		# => 3
f.bar = :wowzo	# => :wowzo
f.bar = 'boo!'	# => 'boo!'
#f.history(:bar)	# => [3, :wowzo, 'boo!']
