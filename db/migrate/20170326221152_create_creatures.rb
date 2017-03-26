class CreateCreatures < ActiveRecord::Migration[5.0]
  def change
    create_table :creatures do |t|
      t.string :name
      t.string :image_url
      t.string :wiki_url
      t.integer :exp

      t.timestamps
    end
  end
end
