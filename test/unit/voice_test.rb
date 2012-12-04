require 'test_helper'

class VoiceTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Voice.new.valid?
  end
end
