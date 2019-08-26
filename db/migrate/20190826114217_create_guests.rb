# frozen_string_literal: true

class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :name, limit: 75
      t.integer :priority
      t.string :tags, limit: 50
      t.integer :plus
      t.string :allegiance, limit: 15
      t.string :invited_to, limit: 25
      t.string :email, limit: 254
      t.string :invite_code, limit: 10
      t.string :invite_link, limit: 75
      t.datetime :invite_sent
      t.string :street, limit: 100
      t.string :town, limit: 25
      t.string :county, limit: 25
      t.string :postcode, limit: 10
      t.string :country, limit: 25
    end
  end
end
