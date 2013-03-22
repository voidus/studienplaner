class AddModulKeyColumn < ActiveRecord::Migration
  def change
    add_column :moduls, :key, :string, length: 50
  end
end
