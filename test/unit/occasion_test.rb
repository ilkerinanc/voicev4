require 'test_helper'

class OccasionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Occasion.new.valid?
  end
end
