class CreateModuls < ActiveRecord::Migration
  def change
    create_table :moduls do |t|
      t.string :name
      t.text :source_tex
      t.integer :credits
    end

    create_table :moduls_studienplans, id: false do |t|
      t.integer :modul_id
      t.integer :studienplan_id
    end

    add_index :moduls_studienplans, :modul_id
    add_index :moduls_studienplans, :studienplan_id
  end
end
