require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  test "should not save answer without question_id" do
  		answer = Answer.new
  		answer.question_id = nil
  		assert !answer.save, "Saved the answer without a question_id"
	end
end
