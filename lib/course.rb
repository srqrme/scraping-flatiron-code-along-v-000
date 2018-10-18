
class Course
  attr_accessor :title, :rank, :consensus, :movie_url

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    all.clear
  end


end
