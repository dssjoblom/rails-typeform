class CreateRailsTypeformFeedbackFormLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :rails_typeform_feedback_form_links do |t|
      t.references :rails_typeform_feedback_form, foreign_key: true, index: { name: :rails_typeform_ff_links_index }
      t.string :name
      t.text :url

      t.timestamps
    end
  end
end
