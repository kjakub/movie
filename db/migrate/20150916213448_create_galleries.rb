class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.references :film, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
