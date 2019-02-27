class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :state
      t.string :city
      t.string :zip
      t.belongs_to :contact, foreign_key: true

      t.timestamps
    end
  end
end
