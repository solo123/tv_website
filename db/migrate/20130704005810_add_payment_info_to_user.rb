class AddPaymentInfoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :user_infos, :payment_name, :string
    add_column :user_infos, :payment_tel, :string
  end
end
