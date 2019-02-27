class AddLastNameAndFriendToContacts < ActiveRecord::Migration[5.2]
  def change
    # =>        table       column    data types
    add_column :contacts, :last_name, :string
    add_column :contacts, :friend, :boolean
  end
end
