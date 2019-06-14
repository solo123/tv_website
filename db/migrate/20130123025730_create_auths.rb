class CreateAuths < ActiveRecord::Migration[5.0]
  def change
    create_table :auths do |t|
      t.string :role
      t.string :action
      t.string :title
      t.integer :parent_id, :default => 0
      t.timestamps
    end
  end
end
