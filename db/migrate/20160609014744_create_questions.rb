class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :content
      t.text :answer
      t.integer :quiz_id

      t.timestamps
    end
  end
end
