class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :price
    validates :content
    validates :images
 end

 belongs_to          :user
 has_many_attached   :images
 has_many            :comments, dependent: :destroy

 def self.search(search)
  if search != ""
    Item.where('content LIKE(?)', "%#{search}%")
  else
    Item.all
  end
 end

 
end
