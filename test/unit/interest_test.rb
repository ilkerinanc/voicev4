require 'test_helper'

class InterestTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Interest.new.valid?
  end
end
