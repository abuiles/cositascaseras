json.array!(@listings) do |listing|
  json.extract! listing, :title, :description, :price, :store_id
  json.url listing_url(listing, format: :json)
end
