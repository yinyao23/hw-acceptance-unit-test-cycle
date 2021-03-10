class AddDirectorToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :director, :string
  end
    
  def down
    remove_column :movies, :director
  end
end
