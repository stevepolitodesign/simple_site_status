class CreateWebpages < ActiveRecord::Migration[7.1]
  def change
    create_table :webpages do |t|
      # TODO: Add not null constraint
      t.text :url

      t.timestamps
    end
  end
end
