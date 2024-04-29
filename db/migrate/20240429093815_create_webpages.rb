class CreateWebpages < ActiveRecord::Migration[7.1]
  def change
    create_table :webpages do |t|

      t.timestamps
    end
  end
end
