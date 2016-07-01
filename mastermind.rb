class Mastermind
  attr_reader :answer
  def initialize
  	answer = []
  	4.times { answer << (rand(6) + 1).to_s }
  	@answer = answer
  end

  def guess(num)
  	if num == answer
  	  return true
  	else
  	  return false
  	end
  end

  def get_A(num)
  end

  def get_B(num)
  end
end

mastermind = Mastermind.new
p mastermind.answer
p mastermind.guess(mastermind.answer)