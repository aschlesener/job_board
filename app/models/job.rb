class Job < ActiveRecord::Base
	has_many :taggings
	has_many :tags, through: :taggings
	validates :title, presence: true, length: { minimum: 2,  maximum: 50 }
	validates :description, presence: true, length: { minimum: 10,  maximum: 100 }
	validates :salary, :inclusion => 0..300000, allow_nil: true

	def tag_list
		self.tags.collect do |tag|
			tag.name
		end.join(", ")
	end

	def tag_list=(tags_string)
		tag_names = tags_string.split(", ").collect{|s| s.strip.downcase}.uniq
		new_or_found_tags = tag_names.collect {|name| Tag.find_or_create_by(name: name) }
		self.tags = new_or_found_tags
	end
end
