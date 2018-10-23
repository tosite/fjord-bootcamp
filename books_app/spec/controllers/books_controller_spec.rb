# frozen_string_literal: true

require "rails_helper"

RSpec.describe BooksController, type: :controller do
  let(:book)   { user.books.create(params) }
  let(:params) { { title: "title", author: "author" } }
  let(:user)   { create(:user) }

  describe "GET #index" do
    context "ログインしていない場合" do
      it "ログイン画面にリダイレクトする" do
        get :index
        expect(response).to redirect_to("/users/sign_in")
      end
    end
    context "ログインしている場合" do
      before do
        login_user user
        get :index, params: {}
      end
      it "200ステータスが返ってくる" do
        expect(response).to have_http_status(:ok)
      end
      it "Indexページが見える" do
        expect(response).to render_template :index
      end
      it "本が表示されている" do
        expect(assigns(:books)).to match_array book
      end
    end
  end

  describe "GET #show" do
    before do
      login_user user
      get :show, params: { id: book.id }
    end
    it "200ステータスが返ってくる" do
      expect(response).to have_http_status(:ok)
    end
    it "ページが見える" do
      expect(response).to render_template :show
    end
    it "本が表示されている" do
      expect(assigns(:book)).to eq book
    end
  end

  describe "GET #new" do
    before do
      login_user user
      get :new, params: {}
    end
    it "200ステータスが返ってくる" do
      expect(response).to have_http_status(:ok)
    end
    it "本が表示されている" do
      expect(assigns(:book)).to be_a_new Book
    end
  end

  describe "GET #edit" do
    before do
      login_user user
      get :edit, params: { id: book.id }
    end
    it "200ステータスが返ってくる" do
      expect(response).to have_http_status(:ok)
    end
    it "ページが見える" do
      expect(response).to render_template :edit
    end
    it "本が表示されている" do
      expect(assigns(:book)).to eq book
    end
  end

  describe "POST #create" do
    def book_post
      post :create, params: { book: params }
    end

    before { login_user user }
    it "登録できる" do
      expect { book_post }.to change(Book, :count).by(1)
    end
    it "登録データにリダイレクトする" do
      book_post
      b = Book.last
      expect(response).to redirect_to(book_path(b))
    end
  end

  describe "PUT/PATCH #update" do
    let(:update_attr) { { title: "update title", author: "update author" } }
    def book_put
      put :update, params: { id: book.id, book: params.merge!(update_attr) }, session: {}
    end
    before do
      login_user user
      book_put
      book.reload
    end
    it "更新できる" do
      expect { book_put }.to change(Book, :count).by(0)
    end
    it "更新されている" do
      expect(book.title).to eq update_attr[:title]
      expect(book.author).to eq update_attr[:author]
    end
    it "更新データにリダイレクトする" do
      expect(response).to redirect_to(book_path(Book.last))
    end
  end

  describe "DELETE #destroy" do
    def delete_book(id)
      delete :destroy, params: { id: id }
    end

    before { login_user user }

    it "削除できる" do
      b = book
      expect { delete_book(b.id) }.to change(Book, :count).by(-1)
    end
  end
end
