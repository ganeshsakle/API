module Api
  module V1
    class BooksController < ApplicationController
      def index
      render json: Book.all
      end

      def create
        book = Book.new(book_params)
        if book.save
          render json: book, status: :created # 201
        else
          render json: book.errors, status: :unprocessable_entity # 422
        end
      end

      def show
        book = Book.find(params[:id])
        render json: book
      end

      def destroy
        Book.find(params[:id]).destroy!  # if destroy fails it raise an exception
      
        head :no_content

        # rescue ActiveRecord::RecordNotFound  # Exception handling 
        # render json: {}, status: :unprocessable_entity  # the action becomes very lengthy so we 
                                                        # handle the exception by rescue_from 
      end

      private
      def book_params
        params.require(:book).permit(:title, :author)
      end
    end
  end
end
