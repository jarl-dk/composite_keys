class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, primary_key: %i[number] do |t|
      t.integer :number
      t.string :title

      t.timestamps
    end
  end
end
