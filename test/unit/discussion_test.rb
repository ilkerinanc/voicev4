require 'test_helper'

class DiscussionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def test_should_be_valid
    assert Discussion.new.valid?
  end

  def test_should_be_valid2
  	discussion = Discussion.new
  	discussion.name = "yeni"
    discussion.description = "hshs"
  	discussion.in_trash = false
  	discussion.creator_id = 2
    assert discussion.save ,"Save discussion without name"
  end
end
