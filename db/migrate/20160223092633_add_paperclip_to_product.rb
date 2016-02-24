class AddPaperclipToProduct < ActiveRecord::Migration
  def change
    add_attachment :products, :item1
    add_attachment :products, :item2
    add_attachment :products, :item3
    add_attachment :products, :item4
  end
end
