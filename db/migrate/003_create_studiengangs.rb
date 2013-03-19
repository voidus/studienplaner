class CreateStudiengangs < ActiveRecord::Migration
  def change
    create_table :studiengangs do |t|
      t.string :name
      t.text :constraints
    end

    add_column :studienplans, :studiengang_id, :integer
  end
end
