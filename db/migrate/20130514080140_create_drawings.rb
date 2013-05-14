class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.string :project
      t.string :location
      t.string :drawing

      t.timestamps
    end
  end
end
