class AddDefinitionToWords < ActiveRecord::Migration[5.0]
  def change
    add_column :words, :definition, :text
  end
end
