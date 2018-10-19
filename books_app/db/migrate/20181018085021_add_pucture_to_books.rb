# frozen_string_literal: true

class AddPuctureToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :picture, :string
  end
end
