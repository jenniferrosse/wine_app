class CreateWineries < ActiveRecord::Migration
  def change
    create_table :wineries do |t|
      t.string :name
      t.string :country
      t.string :region
      t.string :sub_region
      t.string :green_status
      t.string :certification
      t.string :website
      t.text :about

      t.timestamps null: false
    end
  end
end
