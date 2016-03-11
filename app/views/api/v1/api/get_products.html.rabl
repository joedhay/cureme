object @products => :Products



attributes :id,:category_id,:item_name,:price,:description,:groups,:created_at,:updated_at,:item1_file_name,
           :item2_file_name,:item3_file_name,:item4_file_name,:user_id


node :item1 do |u|
  u.item1(:original)
end

node :item2 do |u|
  u.item2(:original)
end

node :item3 do |u|
  u.item3(:original)
end

node :item4 do |u|
  u.item4(:original)
end
