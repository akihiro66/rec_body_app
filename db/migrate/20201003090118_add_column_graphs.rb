class AddColumnGraphs < ActiveRecord::Migration[6.0]
  def change
    add_column :graphs, :pedometer, :float
  end
end
