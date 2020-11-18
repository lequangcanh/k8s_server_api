class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :url
      t.string :short_key

      t.timestamps
    end

    add_index :links, :short_key, unique: true
  end
end
