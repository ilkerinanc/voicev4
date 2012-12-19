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

	#name: the string to be matched when searching for interest name
	#tag_tokens: array of tag_id's
	#the search results are listed in an order so that the interests
	#which contain the 'name' pattern in their names with the highest 
	#number of tag matches are at the top
	def find_interests(name, tag_tokens)
		
		@interests = Tagging.where("tag_id IN (#{tag_tokens})").collect(&:interest_id)

		#an array of arrays of the form {{interest_id, number_of_occurences},...} in reverse
		#order with respect to number of occurences
		@interest_occurence_hash = @interests.inject(Hash.new(0)) { |hash, item|
			hash[ item ] += 1
			hash}.sort_by{|k,v| v}.reverse

		@results = []
		@interest_occurence_hash.each do |hash|
			if (Interest.find(hash[0]).name =~ /.*#{name}.*/) #REGEX
				@results << hash[0]
			end
		end
		return @results
	end
end
