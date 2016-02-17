json.array!(@products) do |product|
  json.extract! product, :id, :category_id, :item_name, :price, :description, :groups
  json.url product_url(product, format: :json)
end
