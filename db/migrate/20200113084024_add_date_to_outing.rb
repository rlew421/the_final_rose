class AddDateToOuting < ActiveRecord::Migration[5.2]
  def change
    add_column :outings, :date, :date
  end
end
