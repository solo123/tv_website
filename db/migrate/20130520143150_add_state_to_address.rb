class AddStateToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :state, :string
    add_column :addresses, :country, :string
  end
end
