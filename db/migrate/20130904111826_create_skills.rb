class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string  :type
      t.string  :category
      t.integer :years
      t.boolean :formal

      t.timestamps
    end
  end
end