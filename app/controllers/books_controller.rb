class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(title: params[:book][:title], author: params[:book][:author], isbn: params[:book][:isbn])

    if @book.save
      flash[:notice] = "本を登録しました"
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "本を削除しました"
    redirect_to "/"
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(title: params[:book][:title], author: params[:book][:author], isbn: params[:book][:isbn])
      flash[:notice] = "本を更新しました"
      redirect_to @book
    else
      render :edit, status: :unprocessable_entity
    end
  end
end
