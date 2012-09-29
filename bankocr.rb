def digitfunction(test,number)
	digit = ""
	test.each_line do |line|
		digit = digit + line[(number*3)..(number*3)+2] + "\n"
	end
	return digit
end

def barrelroll()


end

def getdigit(toparse,number)
	parse = {
		zero: " _ \n| |\n|_|\n   \n",
		one: "   \n  |\n  |\n   \n",
		two: " _ \n _|\n|_ \n   \n",
		three: " _ \n _|\n _|\n   \n",
		four: "   \n|_|\n  |\n   \n",
		five: " _ \n|_ \n _|\n   \n",
		six: " _ \n|_ \n|_|\n   \n",
		seven: " _ \n  |\n  |\n   \n",
		eight: " _ \n|_|\n|_|\n   \n",
		nine: " _ \n|_|\n _|\n   \n"
	}

	if toparse == parse[:zero]
		return "0"
	elsif toparse == parse[:one]
		return "1"
	elsif toparse == parse[:two]
		return "2"
	elsif toparse == parse[:three]
		return "3"
	elsif toparse == parse[:four]
		return "4"
	elsif toparse == parse[:five]
		return "5"
	elsif toparse == parse[:six]
		return "6"
	elsif toparse == parse[:seven]
		return "7"
	elsif toparse == parse[:eight]
		return "8"
	elsif toparse == parse[:nine]
		return "9"
	else
		puts toparse
		puts "digit #{number}"
		getditi(barrelroll(toparse),number)

		return "?"
	end
end

test = "    _  _     _  _  _  _  _ 
  | _| _||_| _ |_   ||_||_|
  ||_  _|  | _||_|  ||_| _ 
                           "
outstring = ""
digit = ""
checksum = 0
flag = 0

9.times do |number|
	toparse = digitfunction(test,number)
	digit = getdigit(toparse,number)
	outstring << digit
	if digit != "?"
		chk = digit.to_i
		checksum += (9-number)*chk		
	else
		flag = 1
	end
end

print outstring + "\n"

if flag == 1
	puts "ILL"
elsif checksum % 11 != 0
	puts " ERR"
end

puts "checksum = #{checksum}"
