class Video < ActiveRecord::Base
	validates :wistia, :length => { :maximum => 10 }
	def next
		Video.where("id > ?", id).first
	end
	def prev
		Video.where("id < ?", id).last
	end
end
