class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :uri

      t.timestamps null: false
    end
  end
end
