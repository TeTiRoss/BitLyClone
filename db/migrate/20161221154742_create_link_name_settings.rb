class CreateLinkNameSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :link_name_settings do |t|
      t.string :characters
      t.integer :length
      t.integer :variations, limit: 8

      t.timestamps
    end
  end
end
