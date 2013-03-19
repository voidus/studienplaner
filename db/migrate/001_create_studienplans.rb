class CreateStudienplans < ActiveRecord::Migration
  def change
    create_table :studienplans do |t|
      t.string :name
      t.timestamps
    end
  end
end
