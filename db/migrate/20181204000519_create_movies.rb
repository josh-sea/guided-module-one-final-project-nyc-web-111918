class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
    end
  end
end

#### title column created as text not string because Sqlite3 only has 4 datatypes
