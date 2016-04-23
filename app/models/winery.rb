class Winery < ActiveRecord::Base

  def self.search(search)
    where("name ILIKE ? OR country ILIKE ? OR region ILIKE ? OR sub_region ILIKE ? OR about ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
 
  end

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      winery_hash = row.to_hash 
      winery = Winery.where(id: winery_hash["id"])

      if winery.count == 1
        winery.first.update_attributes(winery_hash)
      else
        Winery.create!(winery_hash)
      end # end if !winery.nil?
    end # end CSV.foreach
  end # end self.import(file)

   has_attached_file :thumbnail, styles: { medium: "200x", small: "150x", thumb: "100x" }
    validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/

end # end class
