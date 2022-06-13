class CreateFeedbackForms < ActiveRecord::Migration[6.1]
  def change
    create_table :feedback_forms do |t|
      t.string :language
      t.string :trigger
      t.integer :priority, default: 0
      t.text :typeform_id
      t.boolean :enabled, default: true

      t.timestamps
    end
  end
end
