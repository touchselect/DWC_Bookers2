class SearchesController < ApplicationController
	def search
		@model = params[:model]
		@search_method = params[:search_method]
		@search = params[:search]
		if @model == "User"
			case @search_method
			when "match"
				@users = User.where(name: @search)
			when "forward"
				@users = User.where('name LIKE ?', @search + '%')
			when "backward"
				@users = User.where('name LIKE ?', '%' + @search)
			when "partial"
				@users = User.where('name LIKE ?', '%' + @search + '%')
			end
		else @model == "Book"
			case @search_method
			when "match"
				@books = Book.where(title: @search)
			when "forward"
				@books = Book.where('title LIKE ?', @search + '%')
			when "backward"
				@books = Book.where('title LIKE ?', '%' + @search)
			when "partial"
				@books = Book.where('title LIKE ?', '%' + @search + '%')
			end
		end
	end
end
