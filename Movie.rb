class Movie
  def initialize(title, year)
    @title = title
    @year = year
  end
  attr_accessor :title
  attr_accessor :year
  
  # How to display movie info
  @@include_year = false
  def Movie.include_year=(new_value)
    @@include_year = new_value
  end
  def full_title
    if @@include_year
      "#{self.title} (#{self.year})"
    else; self.title; end
  end
end

# Example use of the Movie class
beautiful = Movie.new('Life is Beautiful', '1997')

# What's the movie's name?
puts "I'm seeing #{beautiful.full_title}"

# And with the year
Movie.include_year = true
puts "I'm seeing #{beautiful.full_title}"

# Change the title
beautiful.title = 'La vita e bella'
puts "Ecco, ora si chiama '#{beautiful.title}!'"
