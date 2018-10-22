# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "" do
    let(:user)   { User.create(params) }
    let(:params) {
      {
      email: "test@example.com",
      }
    }
  end
end
