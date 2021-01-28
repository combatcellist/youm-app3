class AddReferencesToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :content, :text
  end
end
