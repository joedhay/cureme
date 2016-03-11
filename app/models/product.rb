class Product < ActiveRecord::Base
  has_attached_file :item1, styles: { small: "64x64", med: "150x70", large: "600x400" }
  has_attached_file :item2, styles: { small: "64x64", med: "150x70", large: "600x400" }
  has_attached_file :item3, styles: { small: "64x64", med: "150x70", large: "600x400" }
  has_attached_file :item4, styles: { small: "64x64", med: "150x70", large: "600x400" }
  validates_attachment :item1, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment :item2, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment :item3, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment :item4, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def item1_image_url
    self.item1.url(:medium)
  end

  def item2_image_url
    self.item2.url(:medium)
  end

  def item3_image_url
    self.item3.url(:medium)
  end

  def item4_image_url
    self.item4.url(:medium)
  end

end
