class AddCoordinatesToLicornes < ActiveRecord::Migration[7.0]
  def change
    add_column :licornes, :latitude, :float
    add_column :licornes, :longitude, :float
  end
end
