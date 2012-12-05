require 'test_helper'

class SurveyTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert !Survey.new.valid?
  end


  test "should not save survey without name" do
  		survey = Survey.new
  		survey.name = nil
  		assert !survey.save, "Saved the survey without a name"
	end


	test "should not save survey without start_time" do
  		survey = Survey.new
  		survey.start_time = nil
  		assert !survey.save, "Saved the survey without a start_time"
	end

	test "should not save survey without finish_time" do
  		survey = Survey.new
  		survey.finish_time = nil
  		assert !survey.save, "Saved the survey without a finish_time"
	end
end
