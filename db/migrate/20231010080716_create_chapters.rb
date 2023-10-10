class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters, primary_key: %i[book_number number] do |t|
      t.integer :book_number
      t.integer :number
      t.string :title

      t.timestamps
    end
  end
end
