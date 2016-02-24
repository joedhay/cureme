class Product < ActiveRecord::Base
  has_attached_file :item1, styles: { small: "64x64", med: "150x70", large: "320x150" }
  has_attached_file :item2, styles: { small: "64x64", med: "150x70", large: "320x150" }
  has_attached_file :item3, styles: { small: "64x64", med: "150x70", large: "320x150" }
  has_attached_file :item4, styles: { small: "64x64", med: "150x70", large: "320x150" }
  validates_attachment :item1, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment :item2, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment :item3, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment :item4, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
