# frozen_string_literal: true

class AddBooksToUserId < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :user_id, :integer, after: :id, index: true
  end
end
