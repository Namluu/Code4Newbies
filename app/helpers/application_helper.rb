module ApplicationHelper
	# return a title on a per-page basics
	def title
		base_title = "Music4life"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
end
