require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

   def test_should_be_valid
    assert !Question.new.valid?
  end

  	test "should not save question without survey_id" do
  		question = Question.new
  		question.survey_id = nil
  		assert !question.save, "Saved the question without a survey_id"
	end


end
