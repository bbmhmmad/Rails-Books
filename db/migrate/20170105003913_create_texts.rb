class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :title
      t.string :author
      t.string :subject

      t.timestamps null: false
    end
  end
end
