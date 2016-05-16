class RenameWineriesTableToProducers < ActiveRecord::Migration
  def change
    rename_table :wineries, :producers
  end
end
