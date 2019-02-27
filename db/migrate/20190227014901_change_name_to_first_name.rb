class ChangeNameToFirstName < ActiveRecord::Migration[5.2]
  def change
    # table name, original name of column, new column name
    rename_column :contacts, :name, :fist_name
  end
end
