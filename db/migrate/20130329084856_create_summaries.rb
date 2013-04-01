class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :code, unique: true
      t.text :content

      t.timestamps
    end

    add_index :summaries, :code
  end
end
