class CreateBooksTable < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :year_published
      t.references :author

      t.timestamps
    end
  end
end
