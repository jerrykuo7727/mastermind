class Mastermind
  def initialize
  	@answer = generate_answer
  	@guesses = 12
  	@win = false
  end

  def ask_to_guess
  	while @guesses > 0 do
  	  break if @win
      print "#{@guesses} guesses left: "
      input = gets.chomp.split("")
      if guess_valid?(input)
        win = guess(input)
      else
        puts "Invalid guess! Try again."
      end
    end
    gameover
  end

  def guess(num)
  	if num == @answer
  	  @win = true
  	else
  	  a = get_A(num)
  	  b = get_B(num)
  	  puts "Try again, #{a}A#{b}B."
  	  @guesses -= 1
  	end
  end

  def gameover
  	input = nil
  	until ["y", "n"].include?(input)
  	  if @win
        print "You win the game! Restart?[Y/N]"
      else
        print "You lose the game! Restart?[Y/N]"
      end
      input = gets.chomp.downcase
    end
    restart?(input)
  end

  def restart?(input)
    case input
    when "y"
      true
    when "n"
      false
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

  def guess_valid?(input)
  	if input.size == 4 && input.all? { |e| "123456".include?(e) }
  	  return true
  	else
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
  	b = 0
  	@answer.each_with_index do |e, i|
  	  b += 1 if e != num[i] && num.include?(e)
  	end
  	return b
  end
end

puts "***********************************************\n" \
     "* Mastermind: can you guess the right number? *\n" \
     "*   Guess a 4 digit number composed of 1-6.   *\n" \
     "*   A means how many numbers are correct.     *\n" \
     "*   B means how many numbers are misplaced.   *\n" \
     "***********************************************"

restart = true
while restart do
  mastermind = Mastermind.new
  restart = mastermind.ask_to_guess
end
puts "Thanks for playing, byebye :)!"