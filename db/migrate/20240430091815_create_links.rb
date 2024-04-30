class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.text :url
      t.text :text
      t.belongs_to :document, null: false, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
