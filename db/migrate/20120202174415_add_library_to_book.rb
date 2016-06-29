class AddLibraryToBook < ActiveRecord::Migration
  def self.up
     add_column :books, :library_id, :integer
  end

  def self.down
    remove_column :books, :library_id
  end
end
