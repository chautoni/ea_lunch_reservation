class AddCallerIdToSummaries < ActiveRecord::Migration
  def change
    add_column :summaries, :caller_id, :integer
    add_index :summaries, :caller_id
  end
end
