class Tag < ActiveRecord::Base
  	attr_accessible :in_trash, :name

  	has_many :taggings, :foreign_key => "tag_id", :dependent => :destroy
  	has_many :interests, :through => :taggings, :source => :interest

  	def self.tokens(query)
	  	tags = where("name like ?", "%#{query}%")
	  	if tags.empty?
	    	[{:id => "<<<#{query}>>>", :name => "New tag: \"#{query}\""}]
	  	else
	    	tags
	  	end
    end

	def self.ids_from_tokens(tokens)
  		tokens.gsub!(/<<<(.+?)>>>/) { create!(:name => $1).id }
  		tokens.split(',')
	end
end
