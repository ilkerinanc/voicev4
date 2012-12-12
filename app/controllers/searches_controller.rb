class SearchesController < ApplicationController
	def new
    	@search = Search.new
  	end

  	def results
  		@results = find_users(params[:name], params[:surname])
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

	def find_interests(name, tags)
		@conditions = []

		@conditions << "interests.name LIKE '%#{name}%'" unless name.blank?
		@conditions << @tags
end
