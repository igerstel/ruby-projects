# Random Sudoku generator

# box = large-scale, cell = small-scale
# 0 | 1 | 2
# --+---+--
# 3 | 4 | 5
# --+---+--
# 6 | 7 | 8

def zero()
	return([0,0,0,0,0,0,0,0,0])
end

def down(d)
	return [d%3, d%3+3, d%3+6]
end

def side(s)
	return [s-s%3, s-s%3+1, s-s%3+2]
end

nums = [1, 2, 3, 4, 5, 6, 7, 8, 9]
biggrid = []
9.times { biggrid << zero }

box = 0
biggrid[box] = nums.shuffle
while box < 8
	box += 1
	downbox = down(box)
	sidebox = side(box)
	cell = 0

	while cell < 9
		downcell = down(cell)
		sidecell = side(cell)
		current_box = biggrid[box]
		current_col = []
		current_row = []

		3.times do |b|
			3.times do |c|
				current_row << biggrid[sidebox[b]][sidecell[c]]
				current_col << biggrid[downbox[b]][downcell[c]]
			end
		end

		taken = current_row+current_col+current_box
		avail = nums-taken

		biggrid[box][cell] = avail[rand(avail.size)]
		cell += 1
	end
end

g = biggrid
9.times do |e|
	g[e].map! {|f| f.nil? ? 'X' : f}
end

3.times do |a|
	h = (a-1)*3
	puts "#{g[h][0]} #{g[h][1]} #{g[h][2]} | #{g[h+1][0]} #{g[h+1][1]} #{g[h+1][2]} | #{g[h+2][0]} #{g[h+2][1]} #{g[h+2][2]}"
	puts "#{g[h][3]} #{g[h][4]} #{g[h][5]} | #{g[h+1][3]} #{g[h+1][4]} #{g[h+1][5]} | #{g[h+2][3]} #{g[h+2][4]} #{g[h+2][5]}"
	puts "#{g[h][6]} #{g[h][7]} #{g[h][8]} | #{g[h+1][6]} #{g[h+1][7]} #{g[h+1][8]} | #{g[h+2][6]} #{g[h+2][7]} #{g[h+2][8]}"
	if a < 2
		puts "------+--------+-------"
	end
end

puts "X marks places where no value fits. There is no error correction in the code yet. :("

