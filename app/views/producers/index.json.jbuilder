json.array!(@producers) do |producer|
  json.extract! producer, :id, :name, :country, :region, :sub_region, :green_status, :certification, :website, :about
  json.url producer_url(producer, format: :json)
end
