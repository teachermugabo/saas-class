class Dessert
	def initialize(name, calories)
		@name = name
		@calories = calories
	end

	attr_accessor :name
	attr_accessor :calories

	def healthy? ; @calories.< 200 ; end
	def delicious? ; true ; end

end

class JellyBean < Dessert
	def initialize(name, calories, flavor)
		super(name,calories)
		@flavor = flavor
	end
	
	attr_accessor :flavor

	def delicious?
		not @flavor.casecmp("black licorice").zero?
	end

end
