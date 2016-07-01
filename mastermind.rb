class Mastermind
  attr_reader :answer
  def initialize
  	@answer = generate_answer
  end

  def guess(num)
  	if num == answer
  	  puts "Bingo! That's the answer!"
  	  return true
  	else
  	  a = get_A(num)
  	  b = get_B(num)
  	  puts "Try again, #{a}A#{b}B.  "
  	  return false
  	end
  end

  def generate_answer
  	answer = []
  	until answer.size == 4 do
  	  num = (rand(6) + 1).to_s
  	  answer << num unless answer.include?(num) 
  	end
  	answer
  end

  def get_A(num)
    a = 0
    num.each_with_index do |e, i|
    	a += 1 if e == @answer[i]
    end
    return a
  end

  def get_B(num)
  	b = 0
  	@answer.each_with_index do |e, i|
  	  b += 1 if e != num[i] && num.include?(e)
  	end
  	return b
  end
end

mastermind = Mastermind.new
p mastermind.answer
p mastermind.guess(["1", "2", "3", "4"])