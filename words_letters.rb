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
  result = [word[0...SEQ]]
  limit = word.length-SEQ-1
  limit.times {|n| result << word[n+1..n+SEQ] }
  return result
end

# Compare a line of letter sequences to the dictinoary and list the words they fit.
def word_counter(seq,dict)
  result = dict.select {|d| d if d.include?(seq) }
end

# ----------
words = open(URL) rescue nil  # Pull file from URI, otherwise locally.
words = File.open('words.txt') if words.nil?
unless words.nil?
  (q_dict, a_dict, w_dict) = [],[],[]

  words.each_line do |line|
    q_dict += char_counter(line) if line.length > SEQ # ignore newline by using > instead of >=
    w_dict << line.strip # make an array of all words
  end
  questions = File.new('questions.txt','w')
  questions.puts q_dict.sort.uniq

  questions = File.open('questions.txt','r')
  questions.each_line do |line|
    res = word_counter(line.strip,w_dict)
    a_dict += res unless res.empty?
    w_dict -= res # shrink dictionary as we use its words, for uniqueness
  end
  answers = File.new('answers.txt','w')
  answers.puts a_dict.uniq
else
  # No instructions specified for missing file.
  puts "No file found for URL #{URL}."
end



