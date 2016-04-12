class AddAttachmentThumbnailToWineries < ActiveRecord::Migration
  def self.up
    change_table :wineries do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :wineries, :thumbnail
  end
end
