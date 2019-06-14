class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.integer :employee_info_id
      t.string :ref_data_type
      t.integer :ref_data_id
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.integer :sign_in_count
      t.string :page_url
      t.string :host
      t.string :remote_host
      t.string :remote_addr
      t.string :controller
      t.string :action
      t.string :log_brief
      t.string :log_text
      t.integer :level, :default => 0
      t.timestamps
    end   
  end

end
