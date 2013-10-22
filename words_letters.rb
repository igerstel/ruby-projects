# Ian Gerstel, code test for BeQuick

# Given a list of words (words.txt), generate two output
# files, 'questions' and 'answers'.  'questions' should contain every
# sequence of four letters that appears in exactly one word of the
# dictionary, one sequence per line.  'answers' should contain the
# corresponding words that contain the sequences, in the same order,
# again one per line.

# The words.txt file:
# https://s3.amazonaws.com/uploads.hipchat.com/25112/390680/imtkxgc3z9zf9yk/words.txt

require 'open-uri'

URL = 'https://s3.amazonaws.com/uploads.hipchat.com/25112/390680/imtkxgc3z9zf9yk/words.txt'
SEQ = 4

# Make string of letter sequences for a given word. Assumes no spaces or odd chars in a word.
def char_counter(word)
  result = word[0...SEQ]
  limit = word.length-SEQ-1
  limit.times {|n| result += ' '+word[n+1..n+SEQ]}
  return result
end

# Compare a line of letter sequences to the dictinoary and list the words they fit.
def word_counter(seqs,dict)
  seqs = seqs.split
  result = ''
  dict.each do |word|
    result += word.strip+' ' if seqs.map {|s| word.include?(s) }.all?
  end
  return result.strip
end

# ----------
# words = open(URL) rescue nil  # Assuming file is not local.
words = File.open('words.txt') rescue nil
unless words.nil?
  questions = File.new('questions.txt','w')
  answers = File.new('answers.txt','w')
  a_dict = []

  words.each_line do |line|
    if line.length > SEQ  # ignore final character (endline) by using > instead of >=
      # make shorter dictionary so 'answers' file generation runs faster.
      questions.puts(char_counter(line))
      a_dict << line
    end
  end
  questions = File.open('questions.txt','r')
  questions.each_line {|line| answers.puts(word_counter(line,a_dict)) }


else
  # No instructions specified for missing file.
  puts "No file found for URL #{URL}."
end



