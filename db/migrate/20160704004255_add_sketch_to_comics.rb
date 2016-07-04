class AddSketchToComics < ActiveRecord::Migration
  def change
    add_column :comics, :sketch, :boolean, default: true
  end
end
