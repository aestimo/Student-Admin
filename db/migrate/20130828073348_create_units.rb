class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :unit_code
      t.string :name

      t.timestamps
    end
  end
end
