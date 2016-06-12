class ChangeQuizIdToQuestion < ActiveRecord::Migration[5.0]
  def up
    rename_column :questions, :quiz_id, :questionnaire_id
  end

  def down
  end
end
