class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :school
      t.text :body
      t.timestamps null: false
    end
  end
end
