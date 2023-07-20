class AddDetailsToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :last_name, :string
    add_column :customers, :first_name, :string
    add_column :customers, :kana_last_name, :string
    add_column :customers, :kana_first_name, :string
    add_column :customers, :post_code, :string
    add_column :customers, :address, :string
    add_column :customers, :phone_number, :string
  end
end
