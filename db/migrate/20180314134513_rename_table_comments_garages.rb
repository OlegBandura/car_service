class RenameTableCommentsGarages < ActiveRecord::Migration[5.1]
  def change
    rename_table :comment_garages, :garage_comments
  end
end
