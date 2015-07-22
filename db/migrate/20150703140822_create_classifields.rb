class CreateClassifields < ActiveRecord::Migration
  def change
    create_table :classifields do |t|
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
