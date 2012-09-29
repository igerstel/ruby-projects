require 'nokogiri'
require 'open-uri'

class String
  def string_between marker1, marker2
    self[/#{Regexp.escape(marker1)}(.*?)#{Regexp.escape(marker2)}/m, 1]
  end
end

name = "bill_murray"
url = "bill_murray.html"
doc = Nokogiri::HTML(open(url))
flag = 0
newdoc = []

doc.css('script, link').each { |node| node.remove }
doc.css('body').text.squeeze(" ").squeeze("\n")

start = doc.search('>Full')
stop = doc.search(' Bio</a></div>')

fulln = doc.string_between(start,stop)

#text = File.new("#{name}.txt","w")

#    start = doc.first.search('>Full')
#    stop = doc.first.search(' Bio</a></div>')


#"blahblahblahSTARTfoofoofooENDwowowowowo".string_between_markers("START", "END")
#=> "foofoofoo"

#fulln = doc[/#{start}(.*?)#{stop}/m, 1]
puts fulln
text.close