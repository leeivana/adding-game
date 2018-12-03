class Question
  def initialize()
    @num1 = (rand 20) + 1
    @num2 = (rand 20) + 1
    @answer = @num1 + @num2
    @input = nil
  end

  def ask_question
    "What does #{@num1} plus #{@num2} equal?"
  end

  def check_answer(input)
    return input == @answer
  end
end