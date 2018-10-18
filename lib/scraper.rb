require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page
    doc = Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/best-netflix-movies-to-watch-right-now/"))

    #doc.css(".row.countdown-item").each do |row|
      #course = Course.new
      #course.title = row.css(".article_movie_title h2 a").text
      #course.rank = row.css(".countdown-index").text
      #course.consensus = row.css(".info.critics-consensus").text.split("Critics Consensus:").join
      #course.movie_url = row.css(".article_movie_title div h2 a").attribute("href").value
    #end
  end

  def get_courses
    self.get_page.css(".row.countdown-item")
  end

  def make_courses
    self.get_courses.each do |row|
      course = Course.new
      course.rank = row.css(".countdown-index").text
      course.title = row.css(".article_movie_title h2 a").text
      course.consensus = row.css(".info.critics-consensus").text.split("Critics Consensus:").join
    end
  end

  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts ""
        puts "#{course.rank}    #{course.title}"
        puts "Critics Consensus:    #{course.consensus}"
        puts ""
      end
    end
  end
end

Scraper.new.print_courses
