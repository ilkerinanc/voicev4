class AddAttachmentEventphotoToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      #t.has_attached_file :eventphoto
    end
  end

  def self.down
    drop_attached_file :events, :eventphoto
  end
end
