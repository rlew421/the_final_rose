class AddLocationToOuting < ActiveRecord::Migration[5.2]
  def change
    add_column :outings, :location, :string
  end
end
