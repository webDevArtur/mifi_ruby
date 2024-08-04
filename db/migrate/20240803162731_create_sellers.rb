class CreateSellers < ActiveRecord::Migration[7.0]
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :contact_info
      t.string :address
      t.string :phone_number
      t.string :email
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
