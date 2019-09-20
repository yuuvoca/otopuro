class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user
      t.string :question
      t.string :category
      t.string :softname
      t.timestamps null: false
    end
  end
end
