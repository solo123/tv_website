class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,      :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Encryptable
      # t.string :password_salt

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Token authenticatable
      t.string :authentication_token


      t.timestamps
    end

    add_index :users, :email,           :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    add_index :users, :authentication_token, :unique => true
  end

    create_table(:employees) do |t|
      ## Database authenticatable
      t.string :login_name, :null => false
      t.string :email
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Encryptable
      t.string :password_salt

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      ## Token authenticatable
      # t.string :authentication_token


      t.timestamps
    end

    add_index :employees, :login_name,           :unique => true
    add_index :employees, :reset_password_token, :unique => true
    # add_index :employees, :confirmation_token,   :unique => true
    # add_index :employees, :unlock_token,         :unique => true
    # add_index :employees, :authentication_token, :unique => true

    
   create_table :user_infos do |t|
    	t.integer :user_id
    	t.string :full_name
    	t.string :user_type
    	t.integer :user_level, :default => 0
      t.string :login_name
    	t.string :pin
      t.string :email
      t.string :telephone
      t.string :address
      t.integer :title_photo_id
    	t.integer :status, :default => 0
    	t.timestamps
    end
    create_table :employee_infos do |t|
      t.integer :employee_id
      t.integer :company_id
      t.string :nickname
      t.date :employ_date
      t.string :ssn
      t.string :pin
      t.date :birthday  
      t.string :roles
      t.string :email
      t.string :address
      t.string :telephone
      t.integer :title_photo_id
      t.integer :status, :default => 0
      t.timestamps    
    end
end
