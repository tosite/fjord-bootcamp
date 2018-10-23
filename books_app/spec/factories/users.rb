# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    email { "test@example.com" }
    password { "password" }
    # encrypted_password { "password" }

    # t.string "encrypted_password"
    # t.string "reset_password_token"
    # t.datetime "reset_password_sent_at"
    # t.datetime "remember_created_at"
    # t.datetime "created_at"
    # t.datetime "updated_at"
  end
end
