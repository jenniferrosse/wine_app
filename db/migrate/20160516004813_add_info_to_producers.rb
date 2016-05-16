class AddInfoToProducers < ActiveRecord::Migration
  def change
    add_column :producers, :address, :string
    add_column :producers, :latitude, :float
    add_column :producers, :longitude, :float
  end
end
