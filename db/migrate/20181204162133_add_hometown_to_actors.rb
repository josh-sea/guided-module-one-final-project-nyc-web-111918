class AddHometownToActors < ActiveRecord::Migration[5.0]
  def change
    add_column :actors, :hometown, :string
  end
end
