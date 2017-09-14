class CreateMachinesnacks < ActiveRecord::Migration[5.1]
  def change
    create_table :machinesnacks do |t|
      t.references :snack, foreign_key: true
      t.references :machine, foreign_key: true

      t.timestamps
    end
  end
end
