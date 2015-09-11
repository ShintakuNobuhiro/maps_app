class AddPictureToRecords < ActiveRecord::Migration
  def change
    add_column :records, :picture, :string
  end
end
