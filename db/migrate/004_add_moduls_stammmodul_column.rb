class AddModulsStammmodulColumn < ActiveRecord::Migration
  def change
    add_column :moduls, :stammmodul, :boolean, default: self.quoted_false
  end
end
