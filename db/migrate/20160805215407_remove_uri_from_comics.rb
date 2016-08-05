class RemoveUriFromComics < ActiveRecord::Migration
  def change
    remove_column :comics, :uri, :string
  end
end
