class AddAttachmentSnapshotToGalleries < ActiveRecord::Migration
  def self.up
    change_table :galleries do |t|
      t.attachment :snapshot
    end
  end

  def self.down
    remove_attachment :galleries, :snapshot
  end
end
