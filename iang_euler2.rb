fiboseq = [1, 2]	# start fibonacci array
n = 2		# n is used to count the position in the array
x = 3		# x is the 'new' number in the fibonacci sequence

while x <= 4000000		# for every number to 4 million
	fiboseq[n] = x		# store the 'new' number in the sequence
	x = fiboseq[n] + fiboseq[n-1]		# calculate the next number
	n += 1				# and increment the array position
end

sum = 0		# initialize the sum we are trying to calculate

fiboseq.length.times do |a|		# go through the fibonacci sequence
	if fiboseq[a] % 2 == 0		# check if each number is even
		puts "#{fiboseq[a]} is in position #{a}"	# output to validate
		sum += fiboseq[a]		# if it's even, add current number
	end							#   to the sum we are trying to calculate
end

puts sum		# output the answer!