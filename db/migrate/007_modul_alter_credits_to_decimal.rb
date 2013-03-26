class ModulAlterCreditsToDecimal < ActiveRecord::Migration
  def change
    change_column :moduls, :credits, :decimal, precision: 6, scale: 2
  end
end
