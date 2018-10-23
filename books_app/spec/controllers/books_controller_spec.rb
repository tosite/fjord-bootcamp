# frozen_string_literal: true

require "rails_helper"

RSpec.describe BooksController, type: :controller do
  let(:book)   { Book.create(params) }
  let(:params) { { title: "title", author: "author", user_id: 1 } }
  let(:user)   { create(:user) }

  # def login
  #   login_user user
  # end

  describe "GET #index" do
    context "ログインしていない場合" do
      it "ログイン画面にリダイレクトする" do
        get :index
        expect(response).to redirect_to("/users/sign_in")
      end
    end
    context "ログインしている場合" do
      it "Indexページが見える" do
        login_user user
        get :index
        expect(response).to render_template("books/index")
      end
      it "本が表示されている" do
        login_user user
        get :index
        expect(response).to render_template("books/index")
        # expect(assigns(:books)).to eq book
      end
    end
  end
  describe "POST #create" do
    def book_post(p)
      post :create, params: { book: p }, session: {}
    end
    context "ログインしていない場合" do
      it "ログイン画面にリダイレクトする" do
        book_post params
        expect(response).to redirect_to("/users/sign_in")
      end
    end
    context "ログインしている場合" do
      before { login_user user }
      it "登録できる" do
        book_post params
        expect { book_post(params) }.to change(Book, :count).by(1)
      end
      it "登録したデータに遷移する" do
        book_post params
        b = Book.last
        expect(response).to redirect_to(book_path(b))
      end
    end
  end
end
