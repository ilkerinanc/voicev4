require 'test_helper'

class DiscussionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Discussion.new.valid?
  end

  def test_should_be_valid2
  	discussion = Discussion.new
    discussion.name = "yeni"
	assert discussion.save ,"Save discussion without name"
 end




end
