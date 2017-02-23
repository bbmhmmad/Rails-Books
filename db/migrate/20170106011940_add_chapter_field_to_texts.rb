class AddChapterFieldToTexts < ActiveRecord::Migration
  def change
  	add_column :texts,:chapter,:integer
  end
end
