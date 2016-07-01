class Mastermind
  attr_reader :answer
  def initialize
  	answer = []
  	4.times { answer << (rand(6) + 1).to_s }
  	@answer = answer
  end

  def guess(num)
  	if num == answer
  	  puts "Bingo! That's the answer!"
  	  return true
  	else
  	  a = get_A(num)
  	  puts "Try again, #{a}A.  "
  	  return false
  	end
  end

  def get_A(num)
    a = 0
    num.each_with_index do |e, i|
    	a += 1 if e == @answer[i]
    end
    return a
  end

  def get_B(num)
  end
end

mastermind = Mastermind.new
p mastermind.answer
p mastermind.guess(["1", "2", "3", "4"])