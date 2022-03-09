class CreateDevelopersProgrammingLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :developers_programming_languages do |t|
      t.references :developer, null: false, foreign_key: true
      t.references :programming_language, null: false, foreign_key: true, index: {name: "pro_lan_id"}

      t.timestamps
    end
  end
end
