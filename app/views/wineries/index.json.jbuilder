json.array!(@wineries) do |winery|
  json.extract! winery, :id, :name, :country, :region, :sub_region, :green_status, :certification, :website, :about
  json.url winery_url(winery, format: :json)
end
