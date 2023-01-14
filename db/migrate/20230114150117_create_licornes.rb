class CreateLicornes < ActiveRecord::Migration[7.0]
  def change
    create_table :licornes do |t|
      t.float :price
      t.string :name
      t.integer :age
      t.string :superpower
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
