class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :login
      t.integer :permissions
      t.string :salt
      t.string :password

      t.timestamps
    end
  end
end
