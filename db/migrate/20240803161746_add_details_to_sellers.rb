class AddDetailsToSellers < ActiveRecord::Migration[6.0]
  def change
    unless column_exists?(:sellers, :address)
      add_column :sellers, :address, :string
    end
  end
end
