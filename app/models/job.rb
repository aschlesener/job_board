class Job < ActiveRecord::Base
	has_many :taggings
	has_many :tags, through: :taggings
	validates :title, presence: true, length: { minimum: 2,  maximum: 50 }
	validates :description, presence: true, length: { minimum: 10,  maximum: 100 }
	validates :salary, :inclusion => 0..300000, allow_nil: true
end
