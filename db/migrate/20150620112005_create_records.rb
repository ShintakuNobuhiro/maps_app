class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :content
      t.integer :user_id
      t.float :lat
      t.float :lng
      t.string :weather
      t.string :date

      t.timestamps
    end
    add_index :records, [:user_id,:created_at]
  end
end
