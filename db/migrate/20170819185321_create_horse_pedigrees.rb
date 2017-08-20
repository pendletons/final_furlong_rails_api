# frozen_string_literal: true

class CreateHorsePedigrees < ActiveRecord::Migration[5.1]
  def change
    create_table :horse_pedigrees do |t|
      t.references :horse, index: true, foreign_key: true
      t.integer :sire_id, index: true
      t.integer :dam_id, index: true
    end
    add_foreign_key :horse_pedigrees, :horses, column: :sire_id
    add_foreign_key :horse_pedigrees, :horses, column: :dam_id
  end
end
