require 'nokogiri'
require 'open-uri'

name = "bill_murray"
url = name + ".html"
doc = Nokogiri::HTML(open(url))

keepers = []
alts = []
text = File.new("#{name}.txt","w")

doc.search("//img").each do |img|
	alts = img.attributes['alt'].to_s
    if alts.include?("Bill Murray")
    	if img['src'].include?("pro")
            text.puts(img['src'])
            #keepers << img['src']
    	elsif
    		thesplits = img['src'].split('_')
    		thesplits[0] = "#{thesplits[0]}_ori.jpg"
            text.puts(thesplits[0])
            #keepers << thesplits[0]
    	end
	end
end

text.close