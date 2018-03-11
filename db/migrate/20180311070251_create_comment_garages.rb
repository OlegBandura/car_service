class CreateCommentGarages < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_garages do |t|
      t.references :user, index: true
      t.references :garage, index: true
      t.string :comment

      t.timestamps
    end
  end
end
