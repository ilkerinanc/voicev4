class SearchesController < ApplicationController
	def new
    	@search = Search.new
  	end

  	def user_results
  		@user_results = find_users(params[:name], params[:surname], params[:title], params[:email])
  	end

  	def interest_results
  		@interest_results = find_interests(params[:name], params[:tag_tokens])
  	end


private
  	def find_users(name, surname, title, email)
  		@conditions = []
  		@conditions << "users.name LIKE '%#{name}%'" unless name.blank?
  		@conditions << "users.surname LIKE '%#{surname}%'" unless surname.blank?
  		@conditions << "users.title LIKE '%#{title}%'" unless title.blank?
  		@conditions << "users.email LIKE '%#{email}%'" unless email.blank?
  		
	  	User.where(@conditions.join(' AND '))
	end

	def find_interests(name, tag_tokens)
		@conditions = []

		@conditions << "interests.name LIKE '%#{name}%'" unless name.blank?
		@conditions << @tags
	end
end
