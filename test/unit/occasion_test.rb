require 'test_helper'

class OccasionTest < ActiveSupport::TestCase
	def test_should_be_valid
		assert Occasion.new.valid?
	end

	def properlysaved
    	occasion = Occasion.new
  		assert occasion.save
	end
end