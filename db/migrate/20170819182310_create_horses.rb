# frozen_string_literal: true

class CreateHorses < ActiveRecord::Migration[5.1]
  def change
    enable_extension "citext"

    create_table :horses do |t|
      t.integer  :game_id, index: true, unique: true
      t.string   :type, limit: 20, default: "Racehorse", null: false
      t.citext   :name, index: true, unique: true
      t.string   :gender, limit: 1, default: "C", null: false
      t.integer  :status_id, limit: 2, index: true
      t.integer  :breeder_id, index: true
      t.integer  :owner_id, index: true
      t.integer  :bred_location_id, index: true
      t.date     :dob, index: true
      t.date     :dod
      t.string   :slug, index: true, unique: true
      t.timestamps null: false
    end
  end
end
