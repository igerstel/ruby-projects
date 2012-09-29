require 'nokogiri'
require 'open-uri'

#puts "Enter a name: "
#name = gets
name = "bill_murray"
url = "http://rottentomatoes.com/celebrity/" + name

doc = Nokogiri::HTML(open(url))
afile = File.new("#{name}.html","w")
afile.write(doc)
afile.close
