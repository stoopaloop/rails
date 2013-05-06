class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :resource_name
      t.string :name
      t.text :resource_link
      t.text :resource_description

      t.timestamps
    end
  end
end
