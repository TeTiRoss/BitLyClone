class AddSlugToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :slug, :string, unique: true
  end
end
