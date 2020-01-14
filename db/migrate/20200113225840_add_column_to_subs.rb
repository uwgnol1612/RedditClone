class AddColumnToSubs < ActiveRecord::Migration[5.2]
  def change
    add_column :subs,:moderator_id, :integer, null: false
  end
end
