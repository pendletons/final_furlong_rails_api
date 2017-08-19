# frozen_string_literal: true

class AddStableIdToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :stable_id, :integer, default: 0

    add_index :users, :stable_id, unique: true
  end
end
