class Room < ApplicationRecord
	belongs_to :user
	validates_presence_of :title, :location, :description
	validates :description, length: { in: 10..1024}

	def complete_name
		"#{title}, #{location}"
	end

end
