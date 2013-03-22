class AddStudiengangMandatoryModules < ActiveRecord::Migration
  def change
    create_table :studiengangs_initial_moduls, id: false do |t|
      t.integer :studiengang_id
      t.integer :modul_id
    end
    add_index :studiengangs_initial_moduls, :modul_id
    add_index :studiengangs_initial_moduls, :studiengang_id
  end
end
