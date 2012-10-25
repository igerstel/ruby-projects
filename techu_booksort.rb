# Ruby program to take a list of ninja-related books, sort them, and display vertically.

def showbooks(books,num)
	num.times { |b| puts "#{books[b]}" }
end

def asciify(bookmatrix,num)
	ascii = []
	num.times do |b|
		temp = []
		bookmatrix[b].each_byte do |i|
			temp << i
		end
		ascii[b] = temp
	end

	return(ascii)
end

def deasciify(asciimatrix,rows)
	deascii = []
	rows.times do |row|
		deascii[row] = asciimatrix[row].pack('C*')
	end

	return(deascii)
end

books = ["Ninjas With Low Self-Esteem",
				 "Ninjas Who Are Also Irish Doctors",
				 "Pirates: Ninjas Who Don't Eat Oranges",
				 "Code Ninjas Are Ninjas Too",
				 "Babby's First Stealth-Kill"]

books_random = books.shuffle
num = books.count

puts "Your unsorted books are:"
showbooks(books_random,num)

puts "-------------"
puts "The sorted books are:"
showbooks(sorted = books_random.sort,num)

chars = sorted.max.length
num.times do |b|
	while (sorted[b].length < chars) do
		sorted[b] << ' '
	end
end

ascii = asciify(sorted,num)
asciiflip = ascii.transpose

vertbooks = deasciify(asciiflip,chars)

puts "-------------"
puts "Here are your books on a shelf:"
showbooks(vertbooks,chars)