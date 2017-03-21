class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.string :title
      t.text :description
      t.string :promoter

      t.timestamps null: false
    end
  end
end
