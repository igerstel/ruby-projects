def obfuscate(sentence, hidewords)
	wordarray = sentence.split
	stars = ["*"].hidewords.size.times
	wordarray.replace { |w| hidewords.include? w }
		#if (word == hideword)


end

def report(sentence, wordlist)


end


s = "big string of big words is bigger"
w = ["big", "words"]

puts obfuscate(s,w)

puts report(s,w)