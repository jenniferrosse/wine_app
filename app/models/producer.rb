class Producer < ActiveRecord::Base

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  #scope :USA, -> (country) { where(:country: country) }
  #scope :country, lambda (country) { where country: country }
  scope :search, lambda {|query|
    where("name ILIKE ? OR country ILIKE ? OR region ILIKE ? OR sub_region ILIKE ? OR about ILIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
  }

  scope :map_producers, ->{ where.not(address: '') }

  #def self.search(search)
   # where("name ILIKE ? OR country ILIKE ? OR region ILIKE ? OR sub_region ILIKE ? OR about ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  #end

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      producer_hash = row.to_hash 
      producer = Producer.where(id: producer_hash["id"])

      if producer.count == 1
        producer.first.update_attributes(producer_hash)
      else
        Producer.create!(producer_hash)
      end # end if !winery.nil?
    end # end CSV.foreach
  end # end self.import(file)

    has_attached_file :thumbnail, styles: { medium: "300x", small: "350x250#", thumb: "100x" }
    validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/

end # end class
