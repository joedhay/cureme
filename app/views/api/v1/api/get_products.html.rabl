object @products => :Products



attributes :id,:category_id,:item_name,:price,:description,:groups,:created_at,:updated_at,:item1_file_name,
           :item1_content_type,:item1_file_size,:item1_updated_at,:item2_file_name,:item2_content_type,:item2_file_size,
           :item2_updated_at,:item3_file_name,:item3_content_type,:item3_file_size,:item3_updated_at,:item4_file_name,:item4_content_type,
           :item4_file_size,:item4_updated_at,:user_id

node :item1_original do |u|
  u.item1(:original)
end

node :item2_original do |u|
  u.item2(:original)
end

node :item3_original do |u|
  u.item3(:original)
end

node :item4_original do |u|
  u.item4(:original)
end
