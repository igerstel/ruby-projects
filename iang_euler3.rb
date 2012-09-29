number = 600851475143		# 600 billion!
factors = []		# array to hold the factors up to 600B
primen = []			# array to hold prime numbers up to 600B

currnum = 2			# check for factors starts at 2
maxnum = number 	# number is static, but we can edit maxnum
flag = 0			# used as a placeholder for validity
n = 0				# counts the size of the factors array

# it is computationally easier to calculate factors than primes
#   so we start with factors.
while currnum < maxnum			# find factors
	if number % currnum == 0	# if dividing yields no remainder
		factors[n] = currnum	#   then it is a factor.
		n += 1 					# store value and increment array
		factors[n] = number/currnum	# this means we can also store the
		maxnum = number/currnum		#   number on the 'large side' too
		n += 1						#   and reduce how many numbers we check.
	end				# ex: for 1000, factor 2 also gives us factor 500.
	currnum += 1 	#   so the biggest number we have to check is 500, not 999.
end 				#   then we check 5 and also 200, so we don't have to check
 					#   values above 200. This saves MASSIVE computational time.
factors.sort! 	# sort the factors by number
puts factors
puts "n = #{n}"	# output to see what we have
n = 0 			# reset counter for primes

# when we know the factors we need to check much fewer numbers for primeness.
# this is another trick to reducing computational time.
factors.length.times do |a| 	# go through array of factors
	currcount = 2 				# check for primeness by comparing
	currnum = factors[a] 		#    currcount to currnum
	flag = 0 				# currnum/currcount is our max number...
	while (currcount < currnum/currcount) && (flag == 0) 
		if currnum % currcount == 0		# again, to save computation time.
			flag = 1 		# if there is no remainder then it isn't a prime number!
		else				#   so set the flag and stop checking future numbers
			currcount += 1 	# if there is a remainder, continue checking for primeness
		end 				#   by incrementing the number we compare it to (currcount)
	end
	if flag == 0 			# once all currcounts have been compared to currnum,
		primen[n] = currnum #   if flag is still 0, it means it is prime!
		n += 1 				# ex:  for 5, we check 5%2, 5%3, and 5%4.
		puts n 		# store the value in our prime number array, and increment counter
	end
	currnum += 1 	# now check the next number in our factors array
end 				#  and repeat the cycle

puts primen 		# output the prime numbers
puts "n = #{n}" 	# output their positions