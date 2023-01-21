class CreateTableWithCorrectNameAndIndex < ActiveRecord::Migration[7.0]
  def change
    create_table :question_tags do |t|
      t.references :question, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps
    end
  end
end
