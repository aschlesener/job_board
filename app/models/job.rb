class Job < ActiveRecord::Base
	validates :title, presence: true, length: { minimum: 2,  maximum: 50 }
	validates :description, presence: true, length: { minimum: 10,  maximum: 100 }
end
