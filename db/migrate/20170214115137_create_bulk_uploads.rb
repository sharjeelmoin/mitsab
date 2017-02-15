class CreateBulkUploads < ActiveRecord::Migration[5.0]
  def change
    create_table :bulk_uploads do |t|
      t.string :attachment

      t.timestamps
    end
  end
end
