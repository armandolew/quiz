require 'numbers_in_words'

class AnswerMethods
  def self.set_answer(answer)
    received_answer = Integer(answer) rescue false

    if received_answer == false
      @response = NumbersInWords.in_numbers(answer).to_i
      if @response == 0 and answer != "zero" || answer != "0"
      	@response = answer
      end
    else
      @response = answer.to_i
    end
    @response
  end
end