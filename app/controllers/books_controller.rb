class BooksController < ApplicationController
  def index
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(title: params[:book][:title], author: params[:book][:author], isbn: params[:book][:isbn])
    book.save
    redirect_to '/'
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/'
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(title: params[:book][:title], author: params[:book][:author], isbn: [:book][:isbn])
    redirect_to '/'
  end
end
