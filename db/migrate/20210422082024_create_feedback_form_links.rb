class CreateFeedbackFormLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedback_form_links do |t|
      t.references :feedback_form, foreign_key: true
      t.string :name
      t.text :url

      t.timestamps
    end
  end
end
