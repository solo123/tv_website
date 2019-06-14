class AddOrderAgent < ActiveRecord::Migration[5.0]
  def change
    add_column :order_details, :from_agent_id, :integer
  end
end
