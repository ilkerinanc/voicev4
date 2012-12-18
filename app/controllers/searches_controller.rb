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

	#tag_tokens: array of tag_id's
	def find_interests(name, tag_tokens)
		
		@interests = Tagging.where("tag_id IN (#{tag_tokens})").collect(&:interest_id)

		puts 'INTEREEEEEEEEEST'
		puts @interests

		@interest_occurence_hash = @interests.inject(Hash.new(0)) { |hash, item|
			hash[ item ] += 1
			hash}.sort_by{|k,v| v}.reverse

		@filterbyname = @interest_occurence_hash.select{|key, hash| hash =~ "/*.#{name}.*/" }
		
		puts 'INTEREST OCCURENCE HAAAAAASH'
		puts @interest_occurence_hash
		
		@results = []
		@filterbyname.each do |hash|
			@results << hash[0]
		end

		puts 'HEEEEEEEEEEEEEEEEEEY'
		puts @results

		return @results
	end
end
