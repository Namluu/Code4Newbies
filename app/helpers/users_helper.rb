module UsersHelper
	def gravatar_for(user, className = "gravatar", options = {:size => 50})
		gravatar_image_tag(user.email.downcase, :alt => user.name, :class => className, :gravatar => options)
	end
end
