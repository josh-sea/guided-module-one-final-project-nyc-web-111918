class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.integer :movie_id
      t.integer :actor_id
    end
  end
end
