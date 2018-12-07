class CreateActors < ActiveRecord::Migration[5.0]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :birthday
    end
  end
end

#### name column created as text not string and bday not as datetime because Sqlite3 only has 4 datatypes
