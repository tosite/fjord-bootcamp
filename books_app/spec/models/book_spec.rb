# frozen_string_literal: true

require "rails_helper"

RSpec.describe Book, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # subject { @book.create() }
  let(:book)   { Book.create(params) }
  let(:params) { { title: "title", author: "author" } }
  describe "record" do
  it "データが有効な状態であること" do
    expect(book).to be_valid
  end
end
  describe "title" do
    it "空白でないこと" do
      params[:title] = nil
      expect(book.errors[:title].size).to eq 1
    end
  end
  describe "author" do
  it "空白でないこと" do
    # book = Book.create(author: nil)
    params[:author] = nil
    expect(book.errors[:author].size).to eq 1
  end
end
  # it "" do
  # end
end
