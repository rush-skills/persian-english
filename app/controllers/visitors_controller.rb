class VisitorsController < ApplicationController
  autocomplete :english_word, :word, :full => true
  autocomplete :persian_word, :word, :full => true
	def home
	end
	def phome
	end
	def search
		type = params[:type]
		keyword = params[:q]
		unless keyword.present?
			flash[:error] = "Please enter a word to search"
			redirect_to root_path
		end
		if type=="en"
			@persian = false
			@words = EnglishWord.search keyword
		elsif type=="pr"
			@persian = true
			@words = PersianWord.search keyword
		else
			flash[:error] = "Bad type, retry"
			redirect_to root_path
		end
	end
end
