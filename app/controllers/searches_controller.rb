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
		@tags = []

		tag_tokens.each do |t|
			@tags << "taggings.tag_id LIKE '#{t}' "
		end
		@taggings = Tagging.where(@tags.join(' AND '))

		@interests = []
		@taggings.each do |i|
			@interests << i.interest_id
		end

		# @conditions = []

		# @conditions << "#{@tagged_interests.name} LIKE '#{name}'" unless name.blank?

		# Interest.where(@conditions)

		@result = []
		@interests.each do |e|
			@result << Interest.find(e)
		end

		return @result
	end
end
