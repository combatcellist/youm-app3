class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :price
    validates :content
    validates :images
 end

 belongs_to          :user
 has_many_attached   :images

 
end
