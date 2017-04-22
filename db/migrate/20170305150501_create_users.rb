# frozen_string_literal: true
class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, limit: 50, null: false
      t.string :name, limit: 50, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.integer :status_id, limit: 2
      t.boolean :admin, null: false, default: false
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.integer :sign_in_count, default: 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
      t.timestamps null: false
    end

    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
    add_index :users, :status_id
  end
end
