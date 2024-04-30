class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      # TODO: NOT NULL
      t.text :body
      t.references :webpage, null: false, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
