class CreateFeedbackForms < ActiveRecord::Migration[6.1]
  def change
    create_table :feedback_forms do |t|
      t.string :language
      t.string :trigger
      t.integer :priority, default: 0
      t.text :typeform_url
      t.boolean :logged_in_only, default: false
      t.boolean :logged_in_beta_tester_only, default: false
      t.boolean :enabled, default: true

      t.timestamps
    end
  end
end
