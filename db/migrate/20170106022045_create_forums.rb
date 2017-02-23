class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.references :text, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
