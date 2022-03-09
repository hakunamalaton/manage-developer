class CreateInterviews < ActiveRecord::Migration[7.0]
  def change
    create_table :interviews do |t|
      t.integer :score
      t.belongs_to :developer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
