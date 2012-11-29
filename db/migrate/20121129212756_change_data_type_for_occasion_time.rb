class ChangeDataTypeForOccasionTime < ActiveRecord::Migration
  def up
  	change_table :occasions do |t|
  		t.change :time, :datetime
  	end
  end

  def down
  	change_table :occasions do |t|
  		t.change :time, :date
  	end
  end
end
