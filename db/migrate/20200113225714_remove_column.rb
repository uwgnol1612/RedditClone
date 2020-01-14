class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :subs, :moderator_id
  end
end
