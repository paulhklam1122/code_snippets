class AddReferencesToSnippet < ActiveRecord::Migration
  def change
    add_column :snippets, :private, :integer, default: 0
  end
end
