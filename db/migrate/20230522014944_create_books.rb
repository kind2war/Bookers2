class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string "title"
      t.string "opinion"
      t.integer "user_id"
      t.integer "book_id"
      t.timestamps null: false
    end
  end
end
