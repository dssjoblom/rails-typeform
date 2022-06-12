class RenameTypeformUrl < ActiveRecord::Migration[6.1]
  def change
    rename_column :feedback_forms, :typeform_url, :typeform_id
  end
end
