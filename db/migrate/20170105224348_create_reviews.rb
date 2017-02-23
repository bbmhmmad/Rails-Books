class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :text, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :review
      t.integer :rating

      t.timestamps null: false
    end
  end
end
