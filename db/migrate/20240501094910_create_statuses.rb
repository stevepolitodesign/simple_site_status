class CreateStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :statuses do |t|
      t.integer :code
      t.belongs_to :link, null: false, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
